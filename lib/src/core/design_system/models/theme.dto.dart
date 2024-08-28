import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme.dto.freezed.dart';

@Freezed(fromJson: false)
class ThemeDto with _$ThemeDto {
  const factory ThemeDto({
    @Default(ThemeMode.dark)
    @JsonKey(defaultValue: ThemeMode.dark)
    ThemeMode mode,
    required ThemeData data,
  }) = _ThemeDto;
}
