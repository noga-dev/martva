import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/theme/data/theme.repo.dart';
import 'package:martva/src/core/theme/view/tokens/ds_duration_tokens.dart';
import 'package:martva/src/core/theme/view/tokens/ds_size_tokens.dart';
import 'package:martva/src/core/theme/view/tokens/ds_spacing_tokens.dart';
import 'package:martva/src/core/utils/messaging/toaster.dart';
import 'package:martva/src/features/tickets/context/answer.dto.dart';
import 'package:martva/src/features/tickets/context/ticket.dto.dart';
import 'package:martva/src/features/tickets/data/ticket_translation.repo.dart';
import 'package:martva/src/features/tickets/view/exam_screen/exam_screen_controller.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';

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
    questionPageController = PageController();
    userAnswers = List.generate(
      widget.examTickets.length,
      (index) => (
        ticket: widget.examTickets[index],
        index: null,
        answer: null,
        showExplanation: false,
      ),
    );
    _startTimer();
  }

  @override
  void dispose() {
    questionPageController.dispose();
    _timer.cancel();
    super.dispose();
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
          duration: DurationTokens.shortest,
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
          duration: DurationTokens.shortest,
          curve: Curves.linear,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: NestedScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar.large(
                      elevation: 0,
                      forceElevated: innerBoxIsScrolled,
                      automaticallyImplyLeading: false,
                      collapsedHeight: DSSizeTokens.s.scaleBy(3),
                      expandedHeight: DSSizeTokens.s.scaleBy(3),
                      surfaceTintColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      flexibleSpace: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).scaffoldBackgroundColor,
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.5),
                              Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [
                              0,
                              0.75,
                              1,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: DSSpacingTokens.s.all,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const BackButton(),
                              Text(
                                'Exam - Question ${currentQuestionIndex + 1}/${widget.examTickets.length}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                '${_secondsRemaining ~/ 60}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}',
                                style: const TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                icon: const Icon(Icons.settings),
                                onPressed: () => showModalBottomSheet(
                                  enableDrag: true,
                                  showDragHandle: true,
                                  context: context,
                                  builder: (context) =>
                                      const _SettingsBottomSheet(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                  body: CustomScrollView(
                    slivers: [
                      SliverFillViewport(
                        padEnds: false,
                        delegate: SliverChildListDelegate.fixed([
                          PageView.builder(
                            controller: questionPageController,
                            itemCount: widget.examTickets.length,
                            onPageChanged: (value) {
                              setState(() {
                                currentQuestionIndex = value;
                              });
                            },
                            itemBuilder: (context, index) => TicketCardOrganism(
                              userAnswer: userAnswers[index],
                              ticket: widget.examTickets[index],
                              onAnswerSelected: (ticket, answer) =>
                                  _answerQuestion(ticket, answer),
                            ),
                          ),
                        ]),
                      ),
                      SliverToBoxAdapter(
                        child: _QuestionIndexDotIndicatorsWidget(
                          currentTicket:
                              widget.examTickets[currentQuestionIndex],
                          examTickets: widget.examTickets,
                          currentQuestionIndex: currentQuestionIndex,
                          userAnswers: userAnswers,
                          onTap: (index) => setState(() {
                            // Toaster.info(
                            //   'Going to first unanswered question',
                            //   align: const Alignment(0, 0.6),
                            // );

                            currentQuestionIndex = index;
                            questionPageController.animateToPage(
                              currentQuestionIndex,
                              duration: DurationTokens.shortest,
                              curve: Curves.linear,
                            );
                          }),
                        ),
                      ),
                      SliverPadding(
                        padding: DSSpacingTokens.m.vertical * 4,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: DSSpacingTokens.xxl.all,
              child: FloatingActionButton(
                heroTag: 'exam-fab-next',
                onPressed: currentQuestionIndex < widget.examTickets.length - 1
                    ? _goToNextQuestion
                    : null,
                // child: const Text('Next'),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: DSSizeTokens.l.value,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: DSSpacingTokens.xxl.all,
              child: AnimatedSwitcher(
                duration: DurationTokens.shortest,
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                child: userAnswers[currentQuestionIndex].answer == null
                    ? null
                    : SizedBox(
                        height: 56,
                        child: FloatingActionButton.extended(
                          heroTag: 'exam-fab-explanation',
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
                          label: AnimatedSwitcher(
                            duration: DurationTokens.short,
                            transitionBuilder: (child, animation) =>
                                SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 1),
                                end: const Offset(0, 0),
                              ).animate(animation),
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            ),
                            child: userAnswers[currentQuestionIndex]
                                    .showExplanation
                                ? const Text('Hide Explanation',
                                    key: ValueKey('Hide.Explanation.key'))
                                : const Text(
                                    'Show Explanation',
                                  ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedSwitcher(
              duration: DurationTokens.shortest,
              child: currentQuestionIndex == 0
                  ? null
                  : Padding(
                      padding: DSSpacingTokens.xxl.all,
                      child: FloatingActionButton(
                        heroTag: 'exam-fab-previous',
                        onPressed: currentQuestionIndex > 0
                            ? _goToPreviousQuestion
                            : null,
                        // child: const Text('Previous'),
                        child: Icon(
                          Icons.chevron_left,
                          size: DSSizeTokens.l.value,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
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
  final Function(int index) onTap;
  final List<
      ({
        AnswerDto? answer,
        int? index,
        bool showExplanation,
        TicketDto ticket
      })> userAnswers;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        mainAxisSpacing: DSSpacingTokens.s.value,
        crossAxisSpacing: DSSpacingTokens.s.value,
      ),
      padding: DSSpacingTokens.xxxl.all,
      children: List.generate(examTickets.length, (index) {
        Color dotColor = Colors.grey.withOpacity(0.5);

        if (userAnswers[index].answer != null) {
          dotColor = (userAnswers[index].answer?.correct ?? false)
              ? Colors.green.withOpacity(0.5)
              : Colors.red.withOpacity(0.5);
        }

        return Stack(
          children: [
            AnimatedContainer(
              curve: Curves.easeOut,
              duration: DurationTokens.shortest,
              padding: EdgeInsets.all(currentQuestionIndex == index ? 4 : 8),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(4),
                color: dotColor,
                border: Border.all(
                  color: index == currentQuestionIndex
                      ? Colors.blueAccent
                      : Colors.transparent,
                  width: 4,
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onTap(index),
                onLongPress: () =>
                    Toaster.info('Current question #${currentTicket.id}'),
                child: Center(
                  child: Text(
                    '$index',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
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
    final animationController = useAnimationController();

    return BottomSheet(
      animationController: animationController,
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
              theme.when(
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
                data: (theme) => ListTile(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
