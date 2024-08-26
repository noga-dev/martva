import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket.dto.freezed.dart';
part 'ticket.dto.g.dart';

@JsonSerializable()
@Freezed(fromJson: false)
class TicketDto with _$TicketDto {
  const factory TicketDto({
    @Default('')
    @JsonKey(
      defaultValue: '',
      fromJson: _parseId,
    )
    String id,
    @Default('') @JsonKey(defaultValue: '') String question,
    @Default('') @JsonKey(defaultValue: '') String explanation,
    @Default([]) @JsonKey(defaultValue: []) List<AnswerDto> answers,
    @Default('') @JsonKey(defaultValue: '') String image,
  }) = _TicketDto;

  factory TicketDto.fromJson(Map<String, dynamic> json) =>
      _$TicketDtoFromJson(json);
}

String _parseId(dynamic data) {
  return data.toString();
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
