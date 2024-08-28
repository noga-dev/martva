import 'dart:async';
import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/design_system/data/theme.repo.dart';
import 'package:martva/src/core/design_system/presentation/tokens/ds_duration_tokens.dart';
import 'package:martva/src/core/design_system/presentation/tokens/ds_theme_tokens.dart';
import 'package:martva/src/features/tickets/data/ticket_translation.repo.dart';
import 'package:martva/src/features/tickets/domain/ticket.dto.dart';
import 'package:martva/src/features/tickets/presentation/exam_screen/exam_screen_controller.dart';
import 'package:martva/src/features/tickets/presentation/shared/organisms/ticket_card_organism.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ExamScreen extends HookConsumerWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketsAsyncValue = ref.watch(examScreenControllerProvider);

    return ticketsAsyncValue.when(
      data: (tickets) => ExamContent(examTickets: tickets),
      loading: () => const Scaffold(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Scaffold(
        child: Center(
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
          duration: DurationTokens.quicker,
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
          duration: DurationTokens.quicker,
          curve: Curves.linear,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      headers: [
        ColoredBox(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button.ghost(
                      child: const Icon(RadixIcons.arrowLeft),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                        'Exam - Question ${currentQuestionIndex + 1}/${widget.examTickets.length}'),
                    Text(
                      '${_secondsRemaining ~/ 60}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Button.ghost(
                      child: const Icon(Icons.settings),
                      onPressed: () => openSheet(
                        context: context,
                        position: OverlayPosition.bottom,
                        builder: (context) => const _SettingsBottomSheet(),
                      ),
                    ),
                  ],
                ),
                _QuestionIndexIndicatorsWidget(
                  currentTicket: widget.examTickets[currentQuestionIndex],
                  examTickets: widget.examTickets,
                  currentQuestionIndex: currentQuestionIndex,
                  userAnswers: userAnswers,
                ),
              ],
            ),
          ),
        ),
      ],
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: questionPageController,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                  onPressed:
                      currentQuestionIndex > 0 ? _goToPreviousQuestion : null,
                  child: const Text('Previous'),
                ),
                AnimatedSwitcher(
                  duration: DurationTokens.quickest,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: userAnswers[currentQuestionIndex].answer != null
                      ? Button.text(
                          onPressed: userAnswers[currentQuestionIndex].answer ==
                                  null
                              ? null
                              : () => setState(() {
                                    userAnswers[currentQuestionIndex] = (
                                      ticket: widget
                                          .examTickets[currentQuestionIndex],
                                      index: userAnswers[currentQuestionIndex]
                                          .index,
                                      answer: userAnswers[currentQuestionIndex]
                                          .answer,
                                      showExplanation:
                                          !userAnswers[currentQuestionIndex]
                                              .showExplanation,
                                    );
                                  }),
                          child: AnimatedSwitcher(
                            duration: DurationTokens.quick,
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
                OutlineButton(
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
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class _QuestionIndexIndicatorsWidget extends StatelessWidget {
  const _QuestionIndexIndicatorsWidget({
    required this.currentTicket,
    required this.examTickets,
    required this.currentQuestionIndex,
    required this.userAnswers,
  });

  final TicketDto currentTicket;
  final List<TicketDto> examTickets;
  final int currentQuestionIndex;
  final List<
      ({
        AnswerDto? answer,
        int? index,
        bool showExplanation,
        TicketDto ticket
      })> userAnswers;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      tooltip: Text('Current question #${currentTicket.id}'),
      child: SizedBox(
        height: 16,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(examTickets.length, (index) {
              Color dotColor = Colors.gray;

              if (userAnswers[index].answer != null) {
                dotColor = (userAnswers[index].answer?.correct ?? false)
                    ? Colors.green
                    : Colors.red;
              }

              final dotSize = currentQuestionIndex == index ? 12.0 : 6.0;

              return Padding(
                padding: const EdgeInsets.only(top: 2),
                child: AnimatedContainer(
                  curve: Curves.easeOut,
                  duration: DurationTokens.quick,
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
                ),
              );
            }),
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

    return Container(
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints(maxWidth: 300),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              child: Row(
                children: [
                  const Text('Ticket language'),
                  const Spacer(),
                  Select<TicketTranslation>(
                    onChanged: (value) => ticketTransNotifier.update(value!),
                    itemBuilder: (context, item) => Text(item.name),
                    value: ticketTrans,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    children: [
                      SelectGroup(
                        children: TicketTranslation.values
                            .map((e) =>
                                SelectItemButton(value: e, child: Text(e.name)))
                            .toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  const Text('Auto Advance'),
                  const Spacer(),
                  Toggle(
                    value: false,
                    onChanged: (value) {},
                    child: const Icon(RadixIcons.arrowRight),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                children: [
                  const Text('Appearance'),
                  const Spacer(),
                  Toggle(
                    value: theme.mode == ThemeMode.dark,
                    onChanged: (value) {
                      if (theme.mode == ThemeMode.dark) {
                        return;
                      }
                      themeNotifier.toggleBrightness();
                    },
                    child: const Icon(Icons.brightness_7),
                  ),
                  Toggle(
                    value: theme.mode == ThemeMode.light,
                    onChanged: (value) {
                      if (theme.mode == ThemeMode.light) {
                        return;
                      }

                      themeNotifier.toggleBrightness();
                    },
                    child: const Icon(Icons.brightness_3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
