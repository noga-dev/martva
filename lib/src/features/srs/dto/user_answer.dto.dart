import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/core/utils/aliases/string.dart';

part 'user_answer.dto.freezed.dart';
part 'user_answer.dto.g.dart';

@JsonSerializable()
@Freezed(fromJson: false)
class UserAnswerDto with _$UserAnswerDto {
  @JsonSerializable()
  const factory UserAnswerDto({
    @Default('') @JsonKey() UUID id,
    @Default('') @JsonKey(name: 'flashcard_id') UUID flashcardId,
    @Default('') @JsonKey(name: 'answer_id') UUID answerId,
    @Default('') @JsonKey(name: 'created_at') DateTimeISO8601 createdAt,
  }) = _UserAnswerDto;

  factory UserAnswerDto.fromJson(Map<String, dynamic> json) =>
      _$UserAnswerDtoFromJson(json);
}
