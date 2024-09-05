import 'package:flutter/material.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';

Color getAnswerColor({
  required AnswerDto? answer,
  required AnswerDto? solution,
}) {
  if (solution == null) {
    return Colors.grey.withOpacity(0.5);
  }

  if (answer == null) {
    if (solution.correct) {
      return Colors.green.withOpacity(0.5);
    }

    if (!solution.correct) {
      return Colors.red.withOpacity(0.5);
    }

    return Colors.grey.withOpacity(0.5);
  }

  // Incorrect answer selected by user
  if (answer.ordinal == solution.ordinal && !answer.correct) {
    return Colors.red.withOpacity(0.5);
  }

  // Correct answer (both selected and actual)
  if (answer.correct) {
    return Colors.green.withOpacity(0.5);
  }

  // Any other case (unselected incorrect answers)
  return Colors.grey.withOpacity(0.5);
}
