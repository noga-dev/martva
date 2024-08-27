import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/design_system/data/theme.repo.dart';
import 'package:martva/src/features/tickets/data/ticket.repo.dart';
import 'package:martva/src/features/tickets/data/ticket_translation.repo.dart';
import 'package:martva/src/features/tickets/domain/ticket.dto.dart';
import 'package:martva/src/features/tickets/presentation/shared/organisms/ticket_card_organism.dart';

class ExamScreen extends HookConsumerWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketsAsyncValue = ref.watch(ticketRepoProvider);

    return ticketsAsyncValue.when(
      data: (tickets) => ExamContent(tickets: tickets),
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
  final List<TicketDto> tickets;

  const ExamContent({super.key, required this.tickets});

  @override
  ExamContentState createState() => ExamContentState();
}

class ExamContentState extends State<ExamContent> {
  late List<TicketDto> examTickets;
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
    examTickets = widget.tickets..shuffle();
    examTickets = examTickets.take(30).toList();
    userAnswers = List.generate(
      examTickets.length,
      (index) => (
        ticket: examTickets[index],
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
      if (userAnswers[examTickets.indexOf(ticket)].answer == null) {
        userAnswers[currentQuestionIndex] = (
          ticket: ticket,
          index: userAnswers[currentQuestionIndex].index,
          answer: answer,
          showExplanation: false,
        );

        // Delay moving to the next question to allow the user to see the result
        Future.delayed(const Duration(milliseconds: 500), () {
          if (currentQuestionIndex < examTickets.length - 1) {
            setState(() {
              if (userAnswers[examTickets.indexOf(ticket)].answer?.correct ??
                  false) {
                currentQuestionIndex++;
                questionPageController.nextPage(
                  curve: Curves.easeInCubic,
                  duration: Durations.medium2,
                );
              } else {
                userAnswers[examTickets.indexOf(ticket)] = (
                  ticket: ticket,
                  index: userAnswers[currentQuestionIndex].index,
                  answer: answer,
                  showExplanation: true,
                );
              }
            });
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
          duration: Durations.short4,
          curve: Curves.linear,
        );
      });
    }
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex < examTickets.length - 1) {
      setState(() {
        currentQuestionIndex++;
        questionPageController.nextPage(
          duration: Durations.short4,
          curve: Curves.linear,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(84),
        child: ColoredBox(
          color: Theme.of(context).shadowColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(),
                    Text(
                        'Exam - Question ${currentQuestionIndex + 1}/${examTickets.length}'),
                    Text(
                      '${_secondsRemaining ~/ 60}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => BottomSheet(
                          onClosing: () {},
                          builder: (context) => const _SettingsBottomSheet(),
                        ),
                      ),
                    ),
                  ],
                ),
                _QuestionIndexIndicatorsWidget(
                  currentTicket: examTickets[currentQuestionIndex],
                  examTickets: examTickets,
                  currentQuestionIndex: currentQuestionIndex,
                  userAnswers: userAnswers,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: questionPageController,
              onPageChanged: (value) {
                currentQuestionIndex = value;
              },
              itemBuilder: (context, index) => TicketCardOrganism(
                ticket: examTickets[index],
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
                ElevatedButton(
                  onPressed:
                      currentQuestionIndex > 0 ? _goToPreviousQuestion : null,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: currentQuestionIndex < examTickets.length - 1
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
      message: 'Current question #${currentTicket.id}',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(examTickets.length, (index) {
            Color dotColor = Colors.grey;

            if (index == currentQuestionIndex) {
              dotColor = Colors.blue;
            } else if (userAnswers[index].answer != null) {
              dotColor = (userAnswers[index].answer?.correct ?? false)
                  ? Colors.green
                  : Colors.red;
            }

            return Padding(
              padding: const EdgeInsets.only(top: 2),
              child: AnimatedContainer(
                duration:
                    const Duration(milliseconds: 300), // Animation duration
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: dotColor,
                ),
              ),
            );
          }),
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

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
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
        ],
      ),
    );
  }
}
