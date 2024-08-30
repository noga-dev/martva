import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/app.dart';
import 'package:martva/src/core/utils/messaging/talker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://yjuwxskhexdsggvfzypi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlqdXd4c2toZXhkc2dndmZ6eXBpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQ1MzU3NTcsImV4cCI6MjA0MDExMTc1N30.pjimjJ604HL2QpdhhZIGyPaJUoQAd299_05uQk0OBaU',
  );

  runApp(
    ProviderScope(
      observers: [
        TalkerRiverpodObserver(
          settings: const TalkerRiverpodLoggerSettings(
            enabled: kDebugMode,
            printStateFullData: false,
            printFailFullData: true,
            printProviderFailed: true,
          ),
          talker: talker,
        ),
      ],
      overrides: const [],
      child: const App(),
    ),
  );
}
