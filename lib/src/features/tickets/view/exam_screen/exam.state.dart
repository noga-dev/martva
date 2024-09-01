import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';

part 'exam.state.freezed.dart';

@freezed
class ExamState with _$ExamState {
  const factory ExamState({
    required AsyncValue<List<TicketDto>> tickets,
    required int currentQuestionIndex,
    required List<UserAnswer> userAnswers,
    required Duration timeLeft,
  }) = _ExamState;
}

@freezed
class UserAnswer with _$UserAnswer {
  const factory UserAnswer({
    required TicketDto ticket,
    int? selectedAnswerIndex,
    AnswerDto? selectedAnswer,
    @Default(false) bool showExplanation,
  }) = _UserAnswer;
}
