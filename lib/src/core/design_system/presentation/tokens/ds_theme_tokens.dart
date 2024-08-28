import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DSThemeTokens {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // We use the nicer Material-3 Typography in both M2 and M3 mode.
    typography: Typography.material2021(platform: defaultTargetPlatform),
    scheme: FlexScheme.mango,
    // colorScheme: _colorScheme,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 12.0,
      outlinedButtonRadius: 15.0,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: const VisualDensity(
      horizontal: VisualDensity.maximumDensity,
      vertical: VisualDensity.maximumDensity,
    ),
    swapLegacyOnMaterial3: true,
    // To use the Playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scheme: FlexScheme.mango,
    // colorScheme: _colorScheme,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      defaultRadius: 12.0,
      outlinedButtonRadius: 15.0,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: const VisualDensity(
      horizontal: VisualDensity.maximumDensity,
      vertical: VisualDensity.maximumDensity,
    ),
    swapLegacyOnMaterial3: true,
    // To use the Playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );
}

// final _colorScheme = SeedColorScheme.fromSeeds(
//   primaryKey: const Color(0xFF6750A4),
// );
