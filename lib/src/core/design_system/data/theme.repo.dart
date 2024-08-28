import 'package:martva/src/core/design_system/models/theme.dto.dart';
import 'package:martva/src/core/design_system/presentation/tokens/ds_theme_tokens.dart';
import 'package:martva/src/core/utils/messaging/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.repo.g.dart';

@riverpod
class ThemeRepo extends _$ThemeRepo {
  @override
  ThemeDto build() {
    final theme = ThemeDto(
      data: DSThemeTokens.darkTheme,
      mode: ThemeMode.dark,
    );

    return theme;
  }

  void toggleBrightness() {
    talker.debug(state.data.brightness);
    if (state.mode == ThemeMode.dark) {
      state = state.copyWith(
        data: DSThemeTokens.lightTheme,
        mode: ThemeMode.light,
      );
    } else {
      state = state.copyWith(
        data: DSThemeTokens.darkTheme,
        mode: ThemeMode.dark,
      );
    }
  }

  void apply(ThemeMode mode) {
    state = state.copyWith(
      mode: mode,
      data: mode == ThemeMode.dark
          ? DSThemeTokens.darkTheme
          : DSThemeTokens.lightTheme,
    );
  }
}
