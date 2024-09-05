import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/core/utils/aliases/string.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'answer.dto.freezed.dart';
part 'answer.dto.g.dart';

@JsonSerializable()
@Freezed(fromJson: false)
class AnswerDto with _$AnswerDto {
  const factory AnswerDto({
    @Default('') @JsonKey(defaultValue: '') UUID id,
    @Default('') @JsonKey(defaultValue: '') String answer,
    @Default(-1) @JsonKey(defaultValue: -1) int ordinal,
    @Default(false) @JsonKey(defaultValue: false) bool correct,
  }) = _AnswerDto;

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);

  static AnswerDto skeleton() => AnswerDto(
        answer: BoneMock.words(1 + Random().nextInt(20)),
        ordinal: Random().nextInt(4),
        correct: Random().nextBool(),
      );
}
