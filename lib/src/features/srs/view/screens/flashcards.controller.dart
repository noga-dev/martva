// lib/src/features/srs/view/screens/flashcards.controller.dart

import 'dart:math';

import 'package:martva/src/core/i18n/data/localization.repo.dart';
import 'package:martva/src/core/utils/aliases/string.dart';
import 'package:martva/src/core/utils/extensions/string.dart';
import 'package:martva/src/features/srs/dto/flashcard.dto.dart';
import 'package:martva/src/features/srs/dto/user_answer.dto.dart';
import 'package:martva/src/features/srs/repo/flashcard.repo.dart';
import 'package:martva/src/features/srs/view/screens/flashcards.state.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:martva/src/features/tickets/repo/ticket.repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flashcards.controller.g.dart';

@Riverpod(dependencies: [
  LocalizationRepo,
  TicketTranslationNotifer,
])
class FlashcardsController extends _$FlashcardsController {
  @override
  Future<FlashcardsState> build() async {
    await loadFlashcards();
    return state.valueOrNull ?? const FlashcardsState();
  }

  Future<void> loadFlashcards() async {
    state = const AsyncLoading();
    try {
      final flashcardRepo = ref.read(flashcardRepoProvider);
      final ticketRepo = ref.read(ticketRepoProvider);

      final dueFlashcards = await flashcardRepo.getDueFlashcards();

      // get all ticket ids
      // get all flashcards
      // filter due and not due flashcards
      // if flashcards's ticket ids are in tickets ids and flashcards is not due, make sure there are no dupes
      // if flashcards is empty, get all tickets without flashcards and create new ones
      // if flashcards is not empty, get all tickets with flashcards and get the next due flashcard

      final language = ref.read(localizationRepoProvider);
      final translation = ref.read(ticketTranslationNotiferProvider);

      if (dueFlashcards.isEmpty) {
        // If no due flashcards, get tickets without flashcards and create new ones
        final allFlashcards = await flashcardRepo.getAllFlashcards();
        final ticketsWithFlashcards =
            allFlashcards.map((f) => f.ticketId).toSet();
        final allTickets = await ticketRepo.getFlashcardTickets(
          limit: 10,
          offset: 0,
          language: language,
          translation: translation,
        );

        final ticketsWithoutFlashcards = allTickets
            .where((t) => !ticketsWithFlashcards.contains(t.id))
            .toList();

        if (ticketsWithoutFlashcards.isNotEmpty) {
          final newFlashcards = await Future.wait(ticketsWithoutFlashcards
              .map((t) => flashcardRepo.createFlashcard(t.id)));

          dueFlashcards.addAll(newFlashcards);
        }
      }

      final tickets = dueFlashcards.isNotEmpty
          ? await ticketRepo.getFlashcardTickets(
              limit: dueFlashcards.length,
              offset: 0,
              language: language,
              translation: translation,
            )
          : <TicketDto>[];

      state = AsyncData(
        FlashcardsState(
          tickets: tickets,
          dueFlashcards: dueFlashcards,
          currentTicketIndex: 0,
          currentFlashcardIndex: 0,
        ),
      );

      if (dueFlashcards.isNotEmpty) {
        await _loadNextFlashcard();
      }
    } catch (e) {
      state = AsyncError(
        e.toString(),
        StackTrace.current,
      );
    }
  }

  Future<FlashcardDto?> answerCurrentFlashcard(UUID answerId) async {
    if (state.value!.currentFlashcardIndex == null ||
        state.value!.currentTicketIndex == null) {
      return null;
    }

    final flashcardRepo = ref.read(flashcardRepoProvider);
    final currentFlashcard =
        state.value!.dueFlashcards[state.value!.currentFlashcardIndex!];
    final currentTicket =
        state.value!.tickets[state.value!.currentTicketIndex!];

    final correct =
        currentTicket.answers.firstWhere((a) => a.id == answerId).correct;

    final updatedFlashcard =
        _updateFlashcardWithFSRS(currentFlashcard, correct);

    await flashcardRepo.updateFlashcard(updatedFlashcard);

    final userAnswer = UserAnswerDto(
      flashcardId: currentFlashcard.id,
      answerId: answerId,
      createdAt: DateTime.now().toIso8601String(),
    );
    await flashcardRepo.logUserAnswer(userAnswer);

    await _loadNextFlashcard();

    return updatedFlashcard;
  }

  FlashcardDto _updateFlashcardWithFSRS(FlashcardDto flashcard, bool correct) {
    final now = DateTime.now();
    final lastReviewedAt = flashcard.lastReviewedAt;
    final daysElapsed =
        now.difference(lastReviewedAt.toISO8601DateTime()).inDays;

    // Calculate new difficulty
    double newDifficulty = flashcard.difficulty + (correct ? -0.1 : 0.1);
    newDifficulty = newDifficulty.clamp(1.3, 2.5);

    // Calculate new interval
    int newInterval;
    if (flashcard.repetitions == 0) {
      newInterval = 1;
    } else if (flashcard.repetitions == 1) {
      newInterval = 6;
    } else {
      // Use daysElapsed to adjust the interval
      newInterval = (flashcard.interval *
              flashcard.easeFactor *
              (1 + (daysElapsed - flashcard.interval) / flashcard.interval))
          .round();
    }

    // Adjust interval based on correctness
    if (!correct) {
      newInterval = max(1, (newInterval * 0.5).round());
    }

    // Calculate new ease factor
    double newEaseFactor = flashcard.easeFactor;

    if (correct) {
      newEaseFactor += 0.1 *
          (1 - (daysElapsed - flashcard.interval) / flashcard.interval)
              .clamp(0, 1);
    } else {
      newEaseFactor -= 0.2 *
          (1 + (daysElapsed - flashcard.interval) / flashcard.interval)
              .clamp(0, 1);
    }

    newEaseFactor = newEaseFactor.clamp(1.3, 2.5);

    // Update repetitions
    int newRepetitions = correct ? flashcard.repetitions + 1 : 0;

    // Calculate next review date
    final nextReviewDate = now.add(Duration(days: newInterval));

    // Calculate new stability (incorporating daysElapsed)
    double newStability =
        flashcard.stability * (correct ? 1.5 : 0.5) * (1 + daysElapsed / 100);
    newStability = newStability.clamp(0.1, 100.0);

    return flashcard.copyWith(
      difficulty: newDifficulty,
      interval: newInterval,
      easeFactor: newEaseFactor,
      repetitions: newRepetitions,
      lastReviewedAt: now.toIso8601String(),
      nextReviewAt: nextReviewDate.toIso8601String(),
      stability: newStability,
      dueDate: nextReviewDate.toIso8601String(),
    );
  }

  Future<void> _loadNextFlashcard() async {
    if (state.value!.dueFlashcards.isEmpty) {
      state = AsyncData(state.value!.copyWith(
        currentFlashcardIndex: null,
        currentTicketIndex: null,
      ));
      return;
    }

    state = AsyncData(state.value!.copyWith(
      currentFlashcardIndex: state.value!.currentFlashcardIndex! + 1,
      currentTicketIndex: state.value!.currentTicketIndex! + 1,
      dueFlashcards: state.value!.dueFlashcards.skip(1).toList(),
    ));
  }
}
