import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';

part 'exam.state.freezed.dart';

@freezed
class ExamState with _$ExamState {
  const factory ExamState({
    @Default(AsyncValue.loading()) AsyncValue<List<TicketDto>> tickets,
    @Default(0) int currentQuestionIndex,
    @Default([]) List<UserAnswer> userAnswers,
    @Default(Duration(minutes: 30)) Duration timeLeft,
  }) = _ExamState;
}

@freezed
class UserAnswer with _$UserAnswer {
  const factory UserAnswer({
    @Default(TicketDto()) TicketDto ticket,
    @Default(0) int selectedAnswerIndex,
    @Default(null) AnswerDto? selectedAnswer,
    @Default(false) bool showExplanation,
  }) = _UserAnswer;
}
