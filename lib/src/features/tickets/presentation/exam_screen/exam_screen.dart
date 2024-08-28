import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/design_system/data/theme.repo.dart';
import 'package:martva/src/core/design_system/presentation/tokens/ds_duration_tokens.dart';
import 'package:martva/src/core/utils/messaging/toaster.dart';
import 'package:martva/src/features/tickets/data/ticket_translation.repo.dart';
import 'package:martva/src/features/tickets/domain/ticket.dto.dart';
import 'package:martva/src/features/tickets/presentation/exam_screen/exam_screen_controller.dart';
import 'package:martva/src/features/tickets/presentation/shared/organisms/ticket_card_organism.dart';

class ExamScreen extends HookConsumerWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketsAsyncValue = ref.watch(examScreenControllerProvider);

    return ticketsAsyncValue.when(
      data: (tickets) => ExamContent(examTickets: tickets),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Scaffold(
        body: Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

class ExamContent extends StatefulWidget {
  final List<TicketDto> examTickets;

  const ExamContent({super.key, required this.examTickets});

  @override
  ExamContentState createState() => ExamContentState();
}

class ExamContentState extends State<ExamContent> {
  int currentQuestionIndex = 0;
  List<
      ({
        TicketDto ticket,
        int? index,
        AnswerDto? answer,
        bool showExplanation
      })> userAnswers = [];
  late Timer _timer;
  int _secondsRemaining = 30 * 60; // 30 minutes
  late PageController questionPageController;

  @override
  void initState() {
    super.initState();
    userAnswers = List.generate(
      widget.examTickets.length,
      (index) => (
        ticket: widget.examTickets[index],
        index: null,
        answer: null,
        showExplanation: false,
      ),
    );
    questionPageController = PageController();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          _showResults();
        }
      });
    });
  }

  void _showResults() {
    final correctAnswers =
        userAnswers.where((answer) => answer.answer?.correct == true).length;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Exam Results'),
          content: Text('You got $correctAnswers out of 30 questions correct.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                // to return to home screen
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _answerQuestion(TicketDto ticket, AnswerDto answer) {
    setState(() {
      if (userAnswers[widget.examTickets.indexOf(ticket)].answer == null) {
        userAnswers[currentQuestionIndex] = (
          ticket: ticket,
          index: userAnswers[currentQuestionIndex].index,
          answer: answer,
          showExplanation: false,
        );

        // Delay moving to the next question to allow the user to see the result
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            if (currentQuestionIndex < widget.examTickets.length - 1) {
              if (userAnswers[widget.examTickets.indexOf(ticket)]
                      .answer
                      ?.correct ??
                  false) {
                _goToNextQuestion();
              } else {
                userAnswers[widget.examTickets.indexOf(ticket)] = (
                  ticket: ticket,
                  index: userAnswers[currentQuestionIndex].index,
                  answer: answer,
                  showExplanation: true,
                );
              }
            } else if (_allQuestionsAnswered()) {
              _timer.cancel();
              _showResults();
            }
          });
        });
      }
    });
  }

  bool _allQuestionsAnswered() {
    return userAnswers.every((answer) => answer.answer != null);
  }

  void _goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        questionPageController.previousPage(
          duration: DurationTokens.shorter,
          curve: Curves.linear,
        );
      });
    }
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex < widget.examTickets.length - 1) {
      setState(() {
        currentQuestionIndex++;
        questionPageController.nextPage(
          duration: DurationTokens.shorter,
          curve: Curves.linear,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  flexibleSpace: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Exam - Question ${currentQuestionIndex + 1}/${widget.examTickets.length}'),
                      Text(
                        '${_secondsRemaining ~/ 60}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      ElevatedButton(
                        child: const Icon(Icons.settings),
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => const _SettingsBottomSheet(),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  child: PageView.builder(
                    controller: questionPageController,
                    itemCount: widget.examTickets.length,
                    onPageChanged: (value) {
                      setState(() {
                        currentQuestionIndex = value;
                      });
                    },
                    itemBuilder: (context, index) => TicketCardOrganism(
                      ticket: widget.examTickets[index],
                      userAnswer: userAnswers[index],
                      onAnswerSelected: _answerQuestion,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              _QuestionIndexDotIndicatorsWidget(
                currentTicket: widget.examTickets[currentQuestionIndex],
                examTickets: widget.examTickets,
                currentQuestionIndex: currentQuestionIndex,
                userAnswers: userAnswers,
                onTap: () => setState(() {
                  Toaster.info('Going to first unanswered question');

                  currentQuestionIndex = userAnswers.indexOf(
                    userAnswers.firstWhere(
                      (element) => element.answer == null,
                    ),
                  );
                  questionPageController.animateToPage(
                    currentQuestionIndex,
                    duration: DurationTokens.shortest,
                    curve: Curves.linear,
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: currentQuestionIndex > 0
                          ? _goToPreviousQuestion
                          : null,
                      child: const Text('Previous'),
                    ),
                    AnimatedSwitcher(
                      duration: DurationTokens.shortest,
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                      child: userAnswers[currentQuestionIndex].answer != null
                          ? TextButton(
                              onPressed: userAnswers[currentQuestionIndex]
                                          .answer ==
                                      null
                                  ? null
                                  : () => setState(() {
                                        userAnswers[currentQuestionIndex] = (
                                          ticket: widget.examTickets[
                                              currentQuestionIndex],
                                          index:
                                              userAnswers[currentQuestionIndex]
                                                  .index,
                                          answer:
                                              userAnswers[currentQuestionIndex]
                                                  .answer,
                                          showExplanation:
                                              !userAnswers[currentQuestionIndex]
                                                  .showExplanation,
                                        );
                                      }),
                              child: AnimatedSwitcher(
                                duration: DurationTokens.short,
                                transitionBuilder: (child, animation) =>
                                    FadeTransition(
                                  opacity: animation,
                                  child: SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0, 1),
                                      end: const Offset(0, 0),
                                    ).animate(animation),
                                    child: ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    ),
                                  ),
                                ),
                                child: userAnswers[currentQuestionIndex]
                                        .showExplanation
                                    ? const Text(
                                        key: ValueKey('Hide.Explanation.key'),
                                        'Hide Explanation',
                                      )
                                    : const Text('Show Explanation'),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                    OutlinedButton(
                      onPressed:
                          currentQuestionIndex < widget.examTickets.length - 1
                              ? _goToNextQuestion
                              : null,
                      child: const Text('Next'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class _QuestionIndexDotIndicatorsWidget extends StatelessWidget {
  const _QuestionIndexDotIndicatorsWidget({
    required this.currentTicket,
    required this.examTickets,
    required this.currentQuestionIndex,
    required this.userAnswers,
    required this.onTap,
  });

  final TicketDto currentTicket;
  final List<TicketDto> examTickets;
  final int currentQuestionIndex;
  final Function() onTap;
  final List<
      ({
        AnswerDto? answer,
        int? index,
        bool showExplanation,
        TicketDto ticket
      })> userAnswers;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onLongPress: () =>
            Toaster.info('Current question #${currentTicket.id}'),
        child: SizedBox(
          height: 24,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(examTickets.length, (index) {
                Color dotColor = Colors.grey;

                if (userAnswers[index].answer != null) {
                  dotColor = (userAnswers[index].answer?.correct ?? false)
                      ? Colors.green
                      : Colors.red;
                }

                final dotSize = currentQuestionIndex == index ? 14.0 : 8.0;

                return AnimatedContainer(
                  curve: Curves.easeOut,
                  duration: DurationTokens.short,
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dotColor,
                    border: Border.all(
                      color: index == currentQuestionIndex
                          ? Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsBottomSheet extends HookConsumerWidget {
  const _SettingsBottomSheet();

  @override
  Widget build(BuildContext context, ref) {
    final ticketTrans = ref.watch(ticketTranslationRepoProvider);
    final ticketTransNotifier =
        ref.read(ticketTranslationRepoProvider.notifier);
    final theme = ref.watch(themeRepoProvider);
    final themeNotifier = ref.watch(themeRepoProvider.notifier);

    return BottomSheet(
      onClosing: () => Toaster.info('Closing settings'),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Ticket language'),
                trailing: DropdownButton<TicketTranslation>(
                  onChanged: (value) => ticketTransNotifier.update(value!),
                  hint: Text(ticketTrans.name),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  elevation: 0,
                  items: TicketTranslation.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                ),
              ),
              CheckboxListTile(
                value: false,
                onChanged: (value) {},
                title: const Text('Auto Advance'),
              ),
              ListTile(
                title: const Text('Appearance'),
                trailing: SegmentedButton<ThemeMode>(
                  selected: {theme.mode},
                  multiSelectionEnabled: false,
                  showSelectedIcon: false,
                  emptySelectionAllowed: false,
                  onSelectionChanged: (val) {
                    themeNotifier.apply(val.first);
                  },
                  segments: const [
                    ButtonSegment(
                      value: ThemeMode.system,
                      icon: Icon(Icons.brightness_auto),
                    ),
                    ButtonSegment(
                      value: ThemeMode.light,
                      icon: Icon(Icons.brightness_7),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      icon: Icon(Icons.brightness_3),
                    ),
                  ],
                ),
              ),
              // Card(
              //   child: Row(
              //     children: [
              //       const Text('Ticket language'),
              //       const Spacer(),
              //       DropdownButton<TicketTranslation>(
              //         onChanged: (value) => ticketTransNotifier.update(value!),
              //         itemBuilder: (context, item) => Text(item.name),
              //         value: ticketTrans,
              //         padding: const EdgeInsets.symmetric(horizontal: 8),
              //         children: [
              //           SelectGroup(
              //             children: TicketTranslation.values
              //                 .map((e) => SelectItemButton(
              //                     value: e, child: Text(e.name)))
              //                 .toList(),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Card(
              //   child: Row(
              //     children: [
              //       const Text('Auto Advance'),
              //       const Spacer(),
              //       Toggle(
              //         value: false,
              //         onChanged: (value) {},
              //         child: const Icon(RadixIcons.arrowRight),
              //       ),
              //     ],
              //   ),
              // ),
              // Card(
              //   child: Row(
              //     children: [
              //       const Text('Appearance'),
              //       const Spacer(),
              //       Toggle(
              //         value: theme.mode == ThemeMode.dark,
              //         onChanged: (value) {
              //           if (theme.mode == ThemeMode.dark) {
              //             return;
              //           }
              //           themeNotifier.toggleBrightness();
              //         },
              //         child: const Icon(Icons.brightness_7),
              //       ),
              //       Toggle(
              //         value: theme.mode == ThemeMode.light,
              //         onChanged: (value) {
              //           if (theme.mode == ThemeMode.light) {
              //             return;
              //           }

              //           themeNotifier.toggleBrightness();
              //         },
              //         child: const Icon(Icons.brightness_3),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
