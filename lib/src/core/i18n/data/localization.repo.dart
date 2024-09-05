import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization.repo.g.dart';

enum SupportedLocale {
  ge,
  en,
  ru;

  String get prettyName => switch (this) {
        SupportedLocale.ge => 'ქართული',
        SupportedLocale.en => 'English',
        SupportedLocale.ru => 'Русский',
      };

  String get languageCode => dbName;

  String get dbName => switch (this) {
        SupportedLocale.ge => 'ge',
        SupportedLocale.en => 'en',
        SupportedLocale.ru => 'ru',
      };

  Locale get locale => Locale(dbName);
}

@Riverpod(
  keepAlive: true,
  dependencies: [],
)
class LocalizationRepo extends _$LocalizationRepo {
  @override
  SupportedLocale build() {
    const locale = SupportedLocale.en;

    return locale;
  }

  void update(SupportedLocale locale) {
    state = locale;
  }
}
