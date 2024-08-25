// File: lib/data/models/ticket.dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket.dto.freezed.dart';
part 'ticket.dto.g.dart';

@freezed
class TicketDto with _$TicketDto {
  const factory TicketDto({
    required int id,
    required String question,
    String? image,
    required String explanation,
    required List<AnswerDto> answers,
  }) = _TicketDto;

  factory TicketDto.fromJson(Map<String, dynamic> json) =>
      _$TicketDtoFromJson(json);
}

@freezed
class AnswerDto with _$AnswerDto {
  const factory AnswerDto({
    required String answer,
    @Default(false) bool correct,
  }) = _AnswerDto;

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);
}
