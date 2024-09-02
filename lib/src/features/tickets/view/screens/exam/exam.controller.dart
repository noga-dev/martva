import 'dart:async';
import 'dart:io' as io;

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
    ref.onDispose(() => _timer?.cancel());
    return _initializeExam();
  }

  AsyncValue<ExamState> _initializeExam() {
    final translation = ref.watch(ticketTranslationNotiferProvider);
    final language = ref.watch(localizationRepoProvider);
    final ticketRepo = ref.watch(ticketRepoProvider);

    if (stateOrNull?.isLoading ?? true) {
      _loadExam(ticketRepo, translation, language);
    } else {
      _updateTicketsTranslation(ticketRepo, translation, language);
    }

    return stateOrNull ?? const AsyncValue.loading();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      stateOrNull?.whenData((examState) {
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

  Future<void> _loadExam(TicketRepo ticketRepo, TicketTranslation translation,
      Locale language) async {
    try {
      final tickets =
          await ticketRepo.select(language: language, translation: translation);
      final examState = ExamState(
        tickets: AsyncValue.data(tickets),
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

  Future<void> _updateTicketsTranslation(TicketRepo ticketRepo,
      TicketTranslation translation, Locale language) async {
    try {
      final updatedTickets =
          await ticketRepo.select(language: language, translation: translation);
      io.stdout.write(StackTrace.current);
      stateOrNull?.whenData((examState) {
        final updatedUserAnswers = examState.userAnswers.map((answer) {
          final updatedTicket =
              updatedTickets.firstWhere((t) => t.id == answer.ticket.id);
          return answer.copyWith(ticket: updatedTicket);
        }).toList();
        state = AsyncValue.data(examState.copyWith(
          tickets: AsyncValue.data(updatedTickets),
          userAnswers: updatedUserAnswers,
        ));
      });
    } catch (e, stack) {
      stateOrNull?.whenData((examState) {
        state = AsyncValue.data(
            examState.copyWith(tickets: AsyncValue.error(e, stack)));
      });
    }
  }

  void answerQuestion(TicketDto ticket, AnswerDto answer) {
    stateOrNull?.whenData((examState) {
      final index =
          examState.userAnswers.indexWhere((ua) => ua.ticket.id == ticket.id);
      if (index != -1 && examState.userAnswers[index].selectedAnswer == null) {
        final newUserAnswers =
            List<QuestionResponse>.from(examState.userAnswers);
        newUserAnswers[index] =
            newUserAnswers[index].copyWith(selectedAnswer: answer);
        state =
            AsyncValue.data(examState.copyWith(userAnswers: newUserAnswers));
      }
    });
  }

  void toggleExplanation(int index) {
    stateOrNull?.whenData((examState) {
      final newUserAnswers = List<QuestionResponse>.from(examState.userAnswers);
      newUserAnswers[index] = newUserAnswers[index].copyWith(
        showExplanation: !newUserAnswers[index].showExplanation,
      );
      state = AsyncValue.data(examState.copyWith(userAnswers: newUserAnswers));
    });
  }

  void goToQuestion(int index) {
    stateOrNull?.whenData((examState) {
      if (index >= 0 && index < examState.userAnswers.length) {
        state =
            AsyncValue.data(examState.copyWith(currentQuestionIndex: index));
      }
    });
  }
}
