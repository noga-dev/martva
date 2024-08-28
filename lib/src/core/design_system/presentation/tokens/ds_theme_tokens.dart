import 'package:shadcn_flutter/shadcn_flutter.dart';

enum ThemeMode {
  light,
  dark,
}

class DSThemeTokens {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorSchemes.lightSlate(),
    radius: 0.6,
    // textTheme: TextStyles.lightTextTheme,
    // Add other theme properties as needed
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorSchemes.darkSlate(),
    radius: 0.6,
    // textTheme: TextStyles.darkTextTheme,
    // Add other theme properties as needed
  );
}
