import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/models/ticket.dto.dart';
import 'package:martva/src/repos/ticket.repo.dart';

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
  int correctAnswers = 0;
  late Timer _timer;
  int _secondsRemaining = 30 * 60; // 30 minutes

  @override
  void initState() {
    super.initState();
    examTickets = widget.tickets..shuffle();
    examTickets = examTickets.take(30).toList();
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

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) correctAnswers++;

    setState(() {
      if (currentQuestionIndex < examTickets.length - 1) {
        currentQuestionIndex++;
      } else {
        _timer.cancel();
        _showResults();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTicket = examTickets[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Exam - Question ${currentQuestionIndex + 1}/30'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                '${_secondsRemaining ~/ 60}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentTicket.question,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (currentTicket.image != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.network(currentTicket.image!),
              ),
            const SizedBox(height: 16),
            ...currentTicket.answers.map(
              (answer) => ElevatedButton(
                onPressed: () => _answerQuestion(answer.correct),
                child: Text(answer.answer),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
