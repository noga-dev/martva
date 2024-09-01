import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/core/utils/aliases/string.dart';
import 'package:martva/src/features/tickets/dto/answer.dto.dart';

part 'ticket.dto.freezed.dart';
part 'ticket.dto.g.dart';

typedef TicketId = String;

@JsonSerializable()
@Freezed(fromJson: false)
class TicketDto with _$TicketDto {
  const factory TicketDto({
    @Default('') @JsonKey(defaultValue: '') UUID id,
    @Default(0) @JsonKey(defaultValue: 0, name: 'ordinal_id') int ordinalId,
    @Default('') @JsonKey(defaultValue: '') String question,
    @Default('') @JsonKey(defaultValue: '') String explanation,
    @Default('') @JsonKey(defaultValue: '') String image,
    @Default([]) @JsonKey(defaultValue: []) List<AnswerDto> answers,
  }) = _TicketDto;

  factory TicketDto.fromJson(Map<String, dynamic> json) =>
      _$TicketDtoFromJson(json);
}
