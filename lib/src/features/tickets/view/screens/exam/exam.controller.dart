// exam.controller.dart

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/service/ticket.service.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exam.controller.g.dart';

@Riverpod(dependencies: [
  getExamTickets,
])
class ExamController extends _$ExamController {
  Timer? _timer;

  @override
  Future<ExamState> build() async {
    final tickets = await ref.watch(getExamTicketsProvider.future);

    ref.onDispose(() {
      if (_timer != null) {
        _timer?.cancel();
      }
    });

    _loadQuestions(tickets: tickets);

    _startTimer();

    return state.valueOrNull ?? const ExamState();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = AsyncValue.data(state.value!.copyWith(
        timeLeft: state.value!.timeLeft - const Duration(seconds: 1),
      ));
      if (state.value!.timeLeft.inSeconds <= 0) {
        _timer?.cancel();
        // Handle exam completion
      }
    });
  }

  Future<void> _loadQuestions({
    required List<TicketDto> tickets,
  }) async {
    if (state.valueOrNull == null || state.value!.solutions.isEmpty) {
      state = AsyncValue.data(ExamState(
        solutions: tickets.map(
          (ticket) {
            return QuestionState(
              ticket: ticket,
            );
          },
        ).toList(),
      ));
    } else {
      state = AsyncValue.data(
        state.value!.copyWith(
          solutions: tickets.map(
            (ticket) {
              final newAnswer = state.value!.solutions
                  .firstWhereOrNull(
                      (question) => question.ticket.id == ticket.id)
                  ?.selectedAnswer;

              return QuestionState(
                ticket: ticket,
                selectedAnswer: newAnswer,
                showExplanation: state.value!.solutions
                    .firstWhere((question) => question.ticket.id == ticket.id)
                    .showExplanation,
              );
            },
          ).toList(),
        ),
      );
    }
  }

  void selectAnswer(int questionIndex, AnswerDto answer) {
    final updatedAnswers = [...state.value!.solutions];

    updatedAnswers[questionIndex] = updatedAnswers[questionIndex].copyWith(
      selectedAnswer: answer,
      showExplanation: !answer.correct,
    );

    state = AsyncValue.data(state.value!.copyWith(
      solutions: updatedAnswers,
    ));

    if (answer.correct) {
      // Delay next question to allow for animation
      Future.delayed(const Duration(milliseconds: 400), () {
        nextQuestion();
      });
    }

    ref.read(ticketServiceProvider).setUserAnswer(
          ticketId: updatedAnswers[questionIndex].ticket.id,
          answerId: answer.id,
        );
  }

  void setQuestionIndex(int index) {
    state = AsyncValue.data(state.value!.copyWith(
      currentQuestionIndex: index,
    ));
  }

  void nextQuestion() {
    if (state.value!.currentQuestionIndex < state.value!.solutions.length - 1) {
      state = AsyncValue.data(state.value!.copyWith(
        currentQuestionIndex: state.value!.currentQuestionIndex + 1,
      ));
    }
  }

  void previousQuestion() {
    if (state.value!.currentQuestionIndex > 0) {
      state = AsyncValue.data(state.value!.copyWith(
        currentQuestionIndex: state.value!.currentQuestionIndex - 1,
      ));
    }
  }

  void toggleExplanation(int questionIndex) {
    final updatedAnswers = [...state.value!.solutions];
    updatedAnswers[questionIndex] = updatedAnswers[questionIndex].copyWith(
      showExplanation: !updatedAnswers[questionIndex].showExplanation,
    );
    state = AsyncValue.data(state.value!.copyWith(
      solutions: updatedAnswers,
    ));
  }
}
