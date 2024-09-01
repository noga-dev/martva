import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization.repo.g.dart';

@Riverpod(
  keepAlive: true,
  dependencies: [],
)
class LocalizationRepo extends _$LocalizationRepo {
  @override
  Locale build() {
    const locale = Locale('en');

    return locale;
  }
}
