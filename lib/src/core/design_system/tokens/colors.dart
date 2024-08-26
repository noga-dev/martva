import 'package:flutter/material.dart';

class ColorTokens {
  static ColorScheme get darkColorScheme {
    return const ColorScheme.dark();
  }

  static ColorScheme get lightColorScheme {
    return const ColorScheme.dark();
  }

  // Primary colors
  static const Color primary = Color(0xFF6200EE); // Example: Purple
  static const Color primaryVariant =
      Color(0xFF3700B3); // Darker shade of primary
  static const Color secondary = Color(0xFF03DAC6); // Example: Teal
  static const Color secondaryVariant =
      Color(0xFF018786); // Darker shade of secondary

  // Background colors
  static const Color background = Color(0xFFF6F6F6); // Light background
  static const Color surface =
      Color(0xFFFFFFFF); // Surface color for cards, etc.

  // Error color
  static const Color error = Color(0xFFB00020); // Error color

  // Text colors
  static const Color onPrimary =
      Colors.white; // Text color on primary background
  static const Color onSecondary =
      Colors.black; // Text color on secondary background
  static const Color onBackground = Colors.black; // Text color on background
  static const Color onSurface = Colors.black; // Text color on surface
  static const Color onError = Colors.white; // Text color on error
}
