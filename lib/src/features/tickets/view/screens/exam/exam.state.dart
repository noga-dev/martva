import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/core/utils/constants.dart';
import 'package:martva/src/features/tickets/view/shared/organisms/ticket_card_organism.dart';

part 'exam.state.freezed.dart';

@freezed
class ExamState with _$ExamState {
  const factory ExamState({
    @Default(0) int currentQuestionIndex,
    @Default(Constants.examTicketsTime) Duration timeLeft,
    @Default([]) List<QuestionState> solutions,
  }) = _ExamState;

  static ExamState skeleton() => ExamState(
        currentQuestionIndex: 0,
        timeLeft: Constants.examTicketsTime,
        solutions: List.generate(
          Random().nextInt(4) + 1,
          (_) => QuestionState.skeleton(),
        ),
      );
}
