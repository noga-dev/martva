import 'dart:async';

import 'package:flutter/material.dart';
import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exam.controller.g.dart';

@riverpod
class ExamScreenController extends _$ExamScreenController {
  Timer? _timer;
  static const examDuration = Duration(minutes: 30);

  @override
  AsyncValue<ExamState> build() {
    final translation = ref.watch(ticketTranslationNotiferProvider);
    final language = ref.watch(localizationRepoProvider);
    final ticketRepo = ref.watch(ticketRepoProvider);

    ref.onDispose(() {
      _timer?.cancel();
    });

    if (stateOrNull == null) {
      state = const AsyncValue.loading();
      loadExam(
        ticketRepo: ticketRepo,
        translation: translation,
        language: language,
      );
    } else {
      updateTicketsTranslation(
        ticketRepo: ticketRepo,
        translation: translation,
        language: language,
      );
    }

    return stateOrNull ?? const AsyncValue.loading();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state.whenData((examState) {
        if (examState.timeLeft > Duration.zero) {
          state = AsyncValue.data(examState.copyWith(
              timeLeft: examState.timeLeft - const Duration(seconds: 1)));
        } else {
          _timer?.cancel();
          // Handle exam time up
        }
      });
    });
  }

  Future<void> loadExam({
    required TicketRepo ticketRepo,
    required TicketTranslation translation,
    required Locale language,
  }) async {
    try {
      final tickets = await ticketRepo.select(
        language: language,
        translation: translation,
      );
      final examState = ExamState(
        tickets: AsyncValue.data(tickets),
        currentQuestionIndex: 0,
        userAnswers:
            tickets.map((ticket) => QuestionResponse(ticket: ticket)).toList(),
        timeLeft: examDuration,
      );
      state = AsyncValue.data(examState);
      _startTimer();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> updateTicketsTranslation({
    required TicketRepo ticketRepo,
    required TicketTranslation translation,
    required Locale language,
  }) async {
    try {
      final updatedTickets = await ticketRepo.select(
        language: language,
        translation: translation,
      );

      // refactor - ticket list in both exam state and user answers should be merged

      final updatedUserAnswers = state.requireValue.userAnswers.map((answer) {
        final updatedTicket = updatedTickets.firstWhere((t) {
          return t.id == answer.ticket.id;
        });
        return answer.copyWith(ticket: updatedTicket);
      }).toList();
      state = AsyncValue.data(state.requireValue.copyWith(
        tickets: AsyncValue.data(updatedTickets),
        userAnswers: updatedUserAnswers,
      ));
    } catch (e, stack) {
      state = AsyncValue.data(
          state.requireValue.copyWith(tickets: AsyncValue.error(e, stack)));
    }
  }

  void answerQuestion(TicketDto ticket, AnswerDto answer) {
    state.whenData((examState) {
      final index =
          examState.userAnswers.indexWhere((ua) => ua.ticket.id == ticket.id);
      if (index != -1 && examState.userAnswers[index].selectedAnswer == null) {
        final newUserAnswers =
            List<QuestionResponse>.from(examState.userAnswers);
        newUserAnswers[index] = newUserAnswers[index].copyWith(
          selectedAnswerIndex: ticket.answers.indexOf(answer),
          selectedAnswer: answer,
        );
        state =
            AsyncValue.data(examState.copyWith(userAnswers: newUserAnswers));
      }
    });
  }

  void toggleExplanation(int index) {
    final newUserAnswers =
        List<QuestionResponse>.from(state.requireValue.userAnswers);
    newUserAnswers[index] = newUserAnswers[index].copyWith(
      showExplanation: !newUserAnswers[index].showExplanation,
    );
    state = AsyncValue.data(
        state.requireValue.copyWith(userAnswers: newUserAnswers));
  }

  void goToNextQuestion() {
    if (state.requireValue.currentQuestionIndex <
        state.requireValue.userAnswers.length - 1) {
      state = AsyncValue.data(state.requireValue.copyWith(
          currentQuestionIndex: state.requireValue.currentQuestionIndex + 1));
    }
  }

  void goToPreviousQuestion() {
    if (state.requireValue.currentQuestionIndex > 0) {
      state = AsyncValue.data(state.requireValue.copyWith(
          currentQuestionIndex: state.requireValue.currentQuestionIndex - 1));
    }
  }

  void goToQuestion(int index) {
    if (index >= 0 && index < state.requireValue.userAnswers.length) {
      state = AsyncValue.data(
          state.requireValue.copyWith(currentQuestionIndex: index));
    }
  }
}
