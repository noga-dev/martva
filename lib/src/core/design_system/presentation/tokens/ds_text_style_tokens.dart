import 'package:flutter/material.dart';
import 'package:martva/src/core/design_system/presentation/tokens/ds_color_tokens.dart';

class TextStyles {
  static TextTheme lightTextTheme = TextTheme(
    titleMedium: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: ColorTokens.onBackground,
    ),
    titleLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorTokens.onBackground,
    ),
    bodyMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: ColorTokens.onBackground,
    ),
    bodySmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ColorTokens.onBackground,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: ColorTokens.onBackground.withOpacity(0.6),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    titleMedium: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: ColorTokens.onSurface,
    ),
    titleSmall: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorTokens.onSurface,
    ),
    bodyMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: ColorTokens.onSurface,
    ),
    bodySmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: ColorTokens.onSurface,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: ColorTokens.onSurface.withOpacity(0.6),
    ),
  );
}
