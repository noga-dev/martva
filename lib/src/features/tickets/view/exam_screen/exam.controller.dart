import 'dart:async';

import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:martva/src/features/tickets/view/exam_screen/exam.state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exam.controller.g.dart';

@riverpod
class ExamScreenController extends _$ExamScreenController {
  late Timer _timer;
  static const examDuration = Duration(minutes: 45);

  @override
  ExamState build() {
    state = const ExamState(
      tickets: AsyncValue.loading(),
      currentQuestionIndex: 0,
      userAnswers: [],
      timeLeft: examDuration,
    );

    ref.onDispose(() {
      _timer.cancel();
    });

    _startTimer();
    loadExam();

    return const ExamState(
      tickets: AsyncValue.loading(),
      currentQuestionIndex: 0,
      userAnswers: [],
      timeLeft: examDuration,
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.timeLeft > Duration.zero) {
        state = state.copyWith(
            timeLeft: state.timeLeft - const Duration(seconds: 1));
      } else {
        _timer.cancel();
        // Handle exam time up
      }
    });
  }

  Future<void> loadExam() async {
    state = state.copyWith(tickets: const AsyncValue.loading());
    try {
      final tickets = await ref.read(ticketRepoProvider).select(
            language: ref.read(
                localizationRepoProvider), // Replace with the user's preferred language
            translation: TicketTranslation
                .original, // Replace with the user's preferred translation
          );
      state = state.copyWith(
        tickets: AsyncValue.data(tickets),
        currentQuestionIndex: 0,
        userAnswers:
            tickets.map((ticket) => UserAnswer(ticket: ticket)).toList(),
      );
    } catch (e, stack) {
      state = state.copyWith(tickets: AsyncValue.error(e, stack));
    }
  }

  Future<void> updateTicketsTranslation(TicketTranslation translation) async {
    state = state.copyWith(tickets: const AsyncValue.loading());
    try {
      final updatedTickets = await ref.read(ticketRepoProvider).select(
            language: ref.read(
                localizationRepoProvider), // Replace with the user's preferred language
            translation: translation,
          );
      state = state.copyWith(
        tickets: AsyncValue.data(updatedTickets),
        userAnswers: state.userAnswers.map((answer) {
          final updatedTicket =
              updatedTickets.firstWhere((t) => t.id == answer.ticket.id);
          return answer.copyWith(ticket: updatedTicket);
        }).toList(),
      );
    } catch (e, stack) {
      state = state.copyWith(tickets: AsyncValue.error(e, stack));
    }
  }

  void answerQuestion(TicketDto ticket, AnswerDto answer) {
    final index =
        state.userAnswers.indexWhere((ua) => ua.ticket.id == ticket.id);
    if (index != -1 && state.userAnswers[index].selectedAnswer == null) {
      final newUserAnswers = List<UserAnswer>.from(state.userAnswers);
      newUserAnswers[index] = newUserAnswers[index].copyWith(
        selectedAnswerIndex: ticket.answers.indexOf(answer),
        selectedAnswer: answer,
      );
      state = state.copyWith(userAnswers: newUserAnswers);
    }
  }

  void toggleExplanation(int index) {
    final newUserAnswers = List<UserAnswer>.from(state.userAnswers);
    newUserAnswers[index] = newUserAnswers[index].copyWith(
      showExplanation: !newUserAnswers[index].showExplanation,
    );
    state = state.copyWith(userAnswers: newUserAnswers);
  }

  void goToNextQuestion() {
    if (state.currentQuestionIndex < state.userAnswers.length - 1) {
      state =
          state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1);
    }
  }

  void goToPreviousQuestion() {
    if (state.currentQuestionIndex > 0) {
      state =
          state.copyWith(currentQuestionIndex: state.currentQuestionIndex - 1);
    }
  }

  void goToQuestion(int index) {
    if (index >= 0 && index < state.userAnswers.length) {
      state = state.copyWith(currentQuestionIndex: index);
    }
  }
}
