import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';

part 'exam.state.freezed.dart';

@freezed
class ExamState with _$ExamState {
  const factory ExamState({
    @Default(0) int currentQuestionIndex,
    @Default(Duration(minutes: 30)) Duration timeLeft,
    @Default([]) List<QuestionState> solutions,
  }) = _ExamState;
}

@freezed
class QuestionState with _$QuestionState {
  const factory QuestionState({
    required TicketDto ticket,
    AnswerDto? selectedAnswer,
    @Default(false) bool showExplanation,
  }) = _QuestionState;
}
