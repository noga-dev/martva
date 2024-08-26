import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/features/tickets/presentation/shared/ticket_image.dart';
import 'package:martva/src/core/features/tickets/repos/ticket.repo.dart';
import 'package:martva/src/core/features/tickets/repos/ticket_translation.repo.dart';
import 'package:martva/src/models/ticket.dto.dart';

class ExamScreen extends HookConsumerWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketsAsyncValue = ref.watch(ticketRepositoryProvider);

    return ticketsAsyncValue.when(
      data: (tickets) => ExamContent(tickets: tickets),
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) =>
          Scaffold(body: Center(child: Text('Error: $error'))),
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
  List<({TicketDto ticket, int? index, AnswerDto? answer})> answers = [];
  late Timer _timer;
  int _secondsRemaining = 30 * 60; // 30 minutes

  @override
  void initState() {
    super.initState();
    examTickets = widget.tickets..shuffle();
    examTickets = examTickets.take(30).toList();
    answers = List.generate(
      examTickets.length,
      (index) => (
        ticket: examTickets[index],
        index: null,
        answer: null,
      ),
    );
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
        answers.where((answer) => answer.answer?.correct == true).length;
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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _answerQuestion(TicketDto ticket, AnswerDto answer) {
    setState(() {
      if (answers[currentQuestionIndex].answer == null) {
        answers[currentQuestionIndex] = (
          ticket: ticket,
          index: answers[currentQuestionIndex].index,
          answer: answer
        );

        // Delay moving to the next question to allow the user to see the result
        Future.delayed(const Duration(milliseconds: 500), () {
          if (currentQuestionIndex < examTickets.length - 1) {
            setState(() {
              currentQuestionIndex++;
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
    return answers.every((answer) => answer.answer != null);
  }

  void _goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex < examTickets.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTicket = examTickets[currentQuestionIndex];
    final userAnswer = answers[currentQuestionIndex];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  collapsedHeight: 84,
                  flexibleSpace: Padding(
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
                                  builder: (context) =>
                                      const _SettingsBottomSheet(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Tooltip(
                          message: 'Current question #${currentTicket.id}',
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:
                                  List.generate(examTickets.length, (index) {
                                Color dotColor = Colors.grey;

                                if (index == currentQuestionIndex) {
                                  dotColor = Colors.blue;
                                  return Text(
                                    currentTicket.id,
                                    style: TextStyle(color: dotColor),
                                  );
                                } else if (answers[index].answer != null) {
                                  dotColor =
                                      (answers[index].answer?.correct ?? false)
                                          ? Colors.green
                                          : Colors.red;
                                }

                                return Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: dotColor,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [
                        if (currentTicket.image.isNotEmpty) ...[
                          Center(
                            child: TicketImage(
                              ticket: currentTicket,
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Text(
                            currentTicket.question,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.symmetric(vertical: 8)),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width < 801 ? 2 : 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 120,
                    ),
                    delegate: SliverChildListDelegate.fixed(
                      List.generate(
                        currentTicket.answers.length,
                        (index) => Stack(
                          fit: StackFit.expand,
                          children: [
                            ElevatedButton(
                              onPressed: userAnswer.answer == null
                                  ? () => _answerQuestion(currentTicket,
                                      currentTicket.answers[index])
                                  : null,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(8),
                                shape: const BeveledRectangleBorder(),
                                disabledBackgroundColor: _getAnswerColor(
                                  userAnswer.answer,
                                  currentTicket.answers,
                                  currentTicket.answers[index],
                                ),
                                foregroundColor: null,
                              ),
                              child: Text(
                                currentTicket.answers[index].answer,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text('${index + 1}'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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

  Color? _getAnswerColor(
    AnswerDto? userAnswer,
    List<AnswerDto> answers,
    AnswerDto answer,
  ) {
    if (answer.correct) {
      // Mild green for correct answer
      return Colors.green.withOpacity(0.4);
    }

    if (!answer.correct && userAnswer?.answer == answer.answer) {
      // Red for wrong selected answer
      return Colors.red.withOpacity(0.4);
    }
    // Grey for other answers
    return Colors.grey.withOpacity(0.2);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class _SettingsBottomSheet extends HookConsumerWidget {
  const _SettingsBottomSheet();

  @override
  Widget build(BuildContext context, ref) {
    final ticketTrans = ref.watch(ticketTranslationRepoProvider);
    final ticketTransNotifier =
        ref.read(ticketTranslationRepoProvider.notifier);

    return Column(
      children: [
        DropdownButton<TicketTranslation>(
          onChanged: (value) => ticketTransNotifier.update(value!),
          hint: Text(ticketTrans.name),
          items: TicketTranslation.values
              .map(
                (e) => DropdownMenuItem(
                  value: ticketTrans,
                  child: Text(e.name),
                ),
              )
              .toList(),
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: const Text('Auto Advance'),
        ),
      ],
    );
  }
}
