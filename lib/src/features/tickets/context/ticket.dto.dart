import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/features/tickets/context/answer.dto.dart';

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
    @Default('') @JsonKey(defaultValue: '') String image,
    @Default([]) @JsonKey(defaultValue: []) List<AnswerDto> answers,
  }) = _TicketDto;

  factory TicketDto.fromJson(Map<String, dynamic> json) =>
      _$TicketDtoFromJson(json);
}

String _parseId(dynamic data) {
  return data.toString();
}
