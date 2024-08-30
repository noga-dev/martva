import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:martva/src/core/design_system/models/theme.dto.dart';
import 'package:martva/src/core/design_system/presentation/tokens/ds_theme_tokens.dart';
import 'package:martva/src/core/utils/messaging/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.repo.g.dart';

@riverpod
class ThemeRepo extends _$ThemeRepo {
  @override
  Future<ThemeDto> build() async {
    await ref.watch(_fetchFontsProvider.future);

    final theme = ThemeDto(
      data: DSThemeTokens.darkTheme,
      mode: ThemeMode.dark,
    );

    return theme;
  }

  void toggleBrightness() {
    talker.debug(state.value!.data.brightness);
    if (state.value!.mode == ThemeMode.dark) {
      state = AsyncData(
        state.value!.copyWith(
          data: DSThemeTokens.lightTheme,
          mode: ThemeMode.light,
        ),
      );
    } else {
      state = AsyncData(
        state.value!.copyWith(
          data: DSThemeTokens.darkTheme,
          mode: ThemeMode.dark,
        ),
      );
    }
  }

  void apply(ThemeMode mode) {
    state = AsyncData(
      state.value!.copyWith(
        mode: mode,
        data: mode == ThemeMode.dark
            ? DSThemeTokens.darkTheme
            : DSThemeTokens.lightTheme,
      ),
    );
  }
}

@riverpod
Future<void> _fetchFonts(_FetchFontsRef ref) async {
  try {
    await GoogleFonts.pendingFonts([
      GoogleFonts.poppins(),
    ]);
  } on Exception catch (e) {
    if (kDebugMode) {
      talker.error(e);
      rethrow;
    }
  }

  return Future.value();
}
