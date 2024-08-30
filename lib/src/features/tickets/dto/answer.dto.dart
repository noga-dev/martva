import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.dto.freezed.dart';
part 'answer.dto.g.dart';

@JsonSerializable()
@Freezed(fromJson: false)
class AnswerDto with _$AnswerDto {
  const factory AnswerDto({
    @Default('') @JsonKey(defaultValue: '') String answer,
    @Default(false) @JsonKey(defaultValue: false) bool correct,
  }) = _AnswerDto;

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);
}
