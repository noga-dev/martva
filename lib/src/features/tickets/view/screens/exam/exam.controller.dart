// exam.controller.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/core/utils/messaging/logger.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exam.controller.g.dart';

@riverpod
class ExamController extends _$ExamController {
  Timer? _timer;

  @override
  ExamState build() {
    final ticketRepo = ref.watch(ticketRepoProvider);
    final ticketTranslation = ref.watch(ticketTranslationNotiferProvider);
    final language = ref.watch(localizationRepoProvider);

    ref.onDispose(() {
      if (_timer != null) {
        _timer?.cancel();
      }
    });

    _startTimer();

    _loadQuestions(
      ticketRepo: ticketRepo,
      translation: ticketTranslation,
      language: language,
    );

    return stateOrNull ?? const ExamState();
  }

  void _startTimer() {
    if (_timer != null) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state.copyWith(
        timeLeft: state.timeLeft - const Duration(seconds: 1),
      );
      if (state.timeLeft.inSeconds <= 0) {
        _timer?.cancel();
        // Handle exam completion
      }
    });
  }

  Future<void> _loadQuestions({
    required TicketRepo ticketRepo,
    required TicketTranslation translation,
    required Locale language,
  }) async {
    final tickets = await ticketRepo.select(
      language: language,
      translation: translation,
    );

    logger.d(
      '${tickets.map((e) => e.id).toList()}'
      '\n'
      '${state.solutions.map((e) => e.ticket.id).toList()}',
    );

    if (stateOrNull == null || state.solutions.isEmpty) {
      state = ExamState(
        solutions: tickets.map(
          (ticket) {
            return QuestionState(
              ticket: ticket,
            );
          },
        ).toList(),
      );
    } else {
      state = state.copyWith(
        solutions: tickets.map(
          (ticket) {
            final newAnswer = state.solutions
                    .firstWhere(
                      (question) => question.ticket.id == ticket.id,
                      orElse: () => QuestionState(
                        ticket: ticket,
                        selectedAnswer: null,
                        showExplanation: false,
                      ),
                    )
                    .selectedAnswer ??
                const AnswerDto();

            return QuestionState(
              ticket: ticket,
              selectedAnswer: AnswerDto(
                answer: ticket.answers
                    .firstWhere((e) => e.ordinal == newAnswer.ordinal)
                    .answer,
                ordinal: newAnswer.ordinal,
                correct: newAnswer.correct,
              ),
              showExplanation: state.solutions
                  .firstWhere((question) => question.ticket.id == ticket.id)
                  .showExplanation,
            );
          },
        ).toList(),
      );
    }
  }

  void selectAnswer(int questionIndex, AnswerDto answer) {
    final updatedAnswers = [...state.solutions];
    updatedAnswers[questionIndex] = updatedAnswers[questionIndex].copyWith(
      selectedAnswer: answer,
    );

    state = state.copyWith(solutions: updatedAnswers);
  }

  void setQuestionIndex(int index) {
    state = state.copyWith(currentQuestionIndex: index);
  }

  void nextQuestion() {
    if (state.currentQuestionIndex < state.solutions.length - 1) {
      state =
          state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1);
    }
  }

  void previousQuestion() {
    if (state.currentQuestionIndex > 0) {
      state =
          state.copyWith(currentQuestionIndex: state.currentQuestionIndex - 1);
    }
  }

  void toggleExplanation(int questionIndex) {
    final updatedAnswers = [...state.solutions];
    updatedAnswers[questionIndex] = updatedAnswers[questionIndex].copyWith(
      showExplanation: !updatedAnswers[questionIndex].showExplanation,
    );
    state = state.copyWith(solutions: updatedAnswers);
  }
}
