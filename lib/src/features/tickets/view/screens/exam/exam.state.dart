import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/core/utils/constants.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';

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
          (_) => QuestionState(
            ticket: TicketDto.skeleton(),
          ),
        ),
      );
}

@freezed
class QuestionState with _$QuestionState {
  const factory QuestionState({
    required TicketDto ticket,
    AnswerDto? selectedAnswer,
    @Default(false) bool showExplanation,
  }) = _QuestionState;
}
