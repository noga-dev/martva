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
    @Default([]) List<QuestionResponse> userAnswers,
    @Default(Duration(minutes: 30)) Duration timeLeft,
  }) = _ExamState;
}

@freezed
class QuestionResponse with _$QuestionResponse {
  const factory QuestionResponse({
    required TicketDto ticket,
    AnswerDto? selectedAnswer,
    @Default(false) bool showExplanation,
  }) = _QuestionResponse;
}
