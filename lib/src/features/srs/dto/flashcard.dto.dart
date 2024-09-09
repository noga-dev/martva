import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/core/utils/aliases/string.dart';

part 'flashcard.dto.freezed.dart';
part 'flashcard.dto.g.dart';

@JsonSerializable()
@Freezed(fromJson: false)
class FlashcardDto with _$FlashcardDto {
  const factory FlashcardDto({
    @Default('') @JsonKey(defaultValue: '') UUID id,
    @Default('') @JsonKey(defaultValue: '', name: 'ticket_id') UUID ticketId,
    @Default('') @JsonKey(name: 'created_at') DateTimeISO8601 createdAt,
    @Default('') @JsonKey(name: 'due_date') DateTimeISO8601 dueDate,
    @Default(0.0) @JsonKey(defaultValue: 0.0) double stability,
    @Default(0.0) @JsonKey(defaultValue: 0.0) double difficulty,
  }) = _FlashcardDto;

  factory FlashcardDto.fromJson(Map<String, dynamic> json) =>
      _$FlashcardDtoFromJson(json);
}
