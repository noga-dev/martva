import 'dart:math';

import 'package:martva/src/core/utils/aliases/string.dart';
import 'package:martva/src/features/srs/dto/flashcard.dto.dart';

class FSRS {
  static const double defaultDifficulty = 5.0;
  static const double defaultStability = 2.0;

  static FlashcardDto updateFlashcard(FlashcardDto flashcard, bool correct) {
    final difficulty = _updateDifficulty(flashcard.difficulty, correct);
    final stability =
        _updateStability(flashcard.stability, difficulty, correct);
    final dueDate = _calculateNextReview(stability);

    return flashcard.copyWith(
      difficulty: difficulty,
      stability: stability,
      dueDate: dueDate.toIso8601String(),
    );
  }

  static double _updateDifficulty(double oldDifficulty, bool correct) {
    final diff = correct ? -1 : 1;
    return max(1, min(10, oldDifficulty + diff * (1 / oldDifficulty)));
  }

  static double _updateStability(
      double oldStability, double difficulty, bool correct) {
    if (correct) {
      return oldStability * (1 + 0.5 * (11 - difficulty) / 10);
    } else {
      return max(1, oldStability * 0.8);
    }
  }

  static DateTime _calculateNextReview(double stability) {
    final daysToAdd = stability.ceil();
    return DateTime.now().add(Duration(days: daysToAdd));
  }

  static FlashcardDto createInitialFlashcard(UUID ticketId) {
    return FlashcardDto(
      ticketId: ticketId,
      difficulty: defaultDifficulty,
      stability: defaultStability,
      createdAt: DateTime.now().toIso8601String(),
      dueDate: DateTime.now().toIso8601String(),
    );
  }
}
