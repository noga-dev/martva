import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/core/utils/aliases/string.dart';
import 'package:martva/src/features/tickets/dto/ticket.dto.dart';

part 'flashcard.dto.freezed.dart';
part 'flashcard.dto.g.dart';

@JsonSerializable()
@Freezed(fromJson: false)
class FlashcardDto with _$FlashcardDto {
  const factory FlashcardDto({
    @Default('')
    @JsonKey(
      defaultValue: '',
      name: 'id',
    )
    UUID id,
    @Default('')
    @JsonKey(
      defaultValue: '',
      name: 'ticket_id',
    )
    TicketId ticketId,
    @Default('')
    @JsonKey(
      defaultValue: '',
      name: 'created_at',
    )
    DateTimeISO8601 createdAt,
    @Default(-1)
    @JsonKey(
      defaultValue: -1,
      name: 'answer_index',
    )
    int answerIndex,
    @Default(0.0)
    @JsonKey(
      defaultValue: 0.0,
      name: 'ease_factor',
    )
    double easeFactor,
    @Default(0)
    @JsonKey(
      defaultValue: 0,
      name: 'interval',
    )
    int interval,
  }) = _FlashcardDto;

  factory FlashcardDto.fromJson(Map<String, dynamic> json) =>
      _$FlashcardDtoFromJson(json);
}
