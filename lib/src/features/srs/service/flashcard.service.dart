import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/features/srs/dto/flashcard.dto.dart';
import 'package:martva/src/features/srs/repo/flashcard.repo.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flashcard.service.g.dart';

class FlashcardService {
  const FlashcardService(this._ref);

  final Ref _ref;

  Future<List<FlashcardDto>> getDueReviews() async {
    final repo = _ref.read(flashcardRepoProvider);

    final results = repo.select();

    return results;
  }

  Future<void> reviewFlashcard({
    required TicketDto ticket,
    required int answerIndex,
    required FlashcardDto flashcard,
  }) async {
    final repo = _ref.read(flashcardRepoProvider);
    final newFlashcard = _calculateNextReview(
      flashcard: flashcard,
      correct: ticket.answers[answerIndex].correct,
    );

    await repo.insert(newFlashcard);
  }

  FlashcardDto _calculateNextReview({
    required FlashcardDto flashcard,
    required bool correct,
  }) {
    double newEaseFactor = flashcard.easeFactor;
    int newInterval = flashcard.interval;

    if (correct) {
      newEaseFactor = max(1.3, flashcard.easeFactor + 0.1);
      newInterval = (flashcard.interval * newEaseFactor).round();
    } else {
      newEaseFactor = max(1.3, flashcard.easeFactor - 0.2);
      newInterval = 1;
    }

    return flashcard.copyWith(
      easeFactor: newEaseFactor,
      interval: newInterval,
    );
  }
}

@riverpod
FlashcardService flashcardService(FlashcardServiceRef ref) {
  return FlashcardService(ref);
}
