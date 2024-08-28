import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:martva/src/core/design_system/presentation/tokens/ds_theme_tokens.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

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
