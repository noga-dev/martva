import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/app.dart';
import 'package:martva/src/core/utils/messaging/talker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const Center(
      child: CircularProgressIndicator.adaptive(),
    ),
  );

  usePathUrlStrategy();

  registerErrorHandlers();

  await Supabase.initialize(
    url: 'https://yjuwxskhexdsggvfzypi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlqdXd4c2toZXhkc2dndmZ6eXBpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQ1MzU3NTcsImV4cCI6MjA0MDExMTc1N30.pjimjJ604HL2QpdhhZIGyPaJUoQAd299_05uQk0OBaU',
  );

  final container = ProviderContainer(
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
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    talker.error(details.exception, details.stack);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    talker.error(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(details.toStringShort()),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
