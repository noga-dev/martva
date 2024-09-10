import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/app.dart';
import 'package:martva/src/core/utils/messaging/logger.dart';
import 'package:martva/src/core/utils/messaging/toaster.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: missing_provider_scope
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
    debug: kDebugMode,
  );

  final container = ProviderContainer(
    observers: [],
    overrides: const [],
  );

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const App(),
    ),
  );
}

class RiverpodObserver implements ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    // logger.d('Riverpod: didAddProvider: $provider');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {}

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {}

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.e(
      'ERROR: $provider',
      error: error,
      stackTrace: stackTrace,
    );

    Toaster.error(error.toString());
  }
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kDebugMode) {
      if (details.exceptionAsString().contains(
          r'''A KeyDownEvent is dispatched, but the state shows that the physical key is already pressed. If this occurs in real application, please report this bug to Flutter. If this occurs in unit tests, please ensure that simulated events follow Flutter's event model as documented in `HardwareKeyboard`. This was the event: KeyDownEvent#d4581(physicalKey: PhysicalKeyboardKey#ea6e1(usbHidUsage: "''')) {
        return;
      }
      if (details.exceptionAsString().contains(
          r'''Attempted to send a key down event when no keys are in keysPressed.''')) {
        return;
      }
    }
    logger.e(
      '[[[flutter error]]]',
      time: DateTime.now(),
      error: details.exceptionAsString(),
      stackTrace: details.stack,
    );
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    logger.e(
      '[[[platform error]]]',
      time: DateTime.now(),
      stackTrace: stack,
      error: error.toString(),
    );

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
