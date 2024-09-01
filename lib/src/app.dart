import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/router/router.dart';
import 'package:martva/src/core/theme/repo/theme.repo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final botToastBuilder = BotToastInit();
    final theme = ref.watch(themeRepoProvider);

    if (theme.isLoading) {
      return const CircularProgressIndicator();
    }

    return MaterialApp.router(
      title: 'Martva - Georgian Driving License Assistant App',
      debugShowCheckedModeBanner: false,
      theme: theme.value?.data,
      // darkTheme: theme.value?.data.darkTheme,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
      routerConfig: router,
      shortcuts: {
        ...WidgetsApp.defaultShortcuts,
        const SingleActivator(LogicalKeyboardKey.escape): VoidCallbackIntent(
          () {
            final hasFocus = Focus.maybeOf(
                        router.routerDelegate.navigatorKey.currentContext!)
                    ?.hasPrimaryFocus ??
                false;

            if (hasFocus) {
              Focus.maybeOf(router.routerDelegate.navigatorKey.currentContext!)
                  ?.unfocus();
            } else {
              Navigator.of(router.routerDelegate.navigatorKey.currentContext!)
                  .maybePop();
            }
          },
        ),
        LogicalKeySet(
          LogicalKeyboardKey(LogicalKeyboardKey.keyD.keyId),
          LogicalKeyboardKey(LogicalKeyboardKey.keyS.keyId),
          LogicalKeyboardKey(LogicalKeyboardKey.control.keyId),
        ): VoidCallbackIntent(
          () => const DevDebugDbSeederRoute()
              .push(router.routerDelegate.navigatorKey.currentContext!),
        ),
      },
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ge'),
        Locale('ru'),
      ],
      locale: const Locale('en'),
    );
  }
}
