import 'package:flutter/material.dart';
import 'package:martva/src/core/design_system/models/theme.dto.dart';
import 'package:martva/src/core/design_system/tokens/themes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.repo.g.dart';

@riverpod
class ThemeRepo extends _$ThemeRepo {
  @override
  ThemeDto build() {
    final theme = ThemeDto(
      data: Themes.darkTheme,
      mode: ThemeMode.dark,
    );

    return theme;
  }

  void toggleBrightness() {
    if (state.data.brightness == Brightness.dark) {
      state = state.copyWith(
        data: Themes.lightTheme,
        mode: ThemeMode.light,
      );
    } else {
      state = state.copyWith(
        data: Themes.darkTheme,
        mode: ThemeMode.dark,
      );
    }
  }

  void apply(ThemeMode mode) {
    state = state.copyWith(
      mode: mode,
    );
  }
}
