import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martva/src/core/design_system/data/theme.repo.dart';
import 'package:martva/src/core/design_system/tokens/themes.dart';
import 'package:martva/src/core/router/router.dart';

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

    return MaterialApp.router(
      title: 'Martva - Driving License App',
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
      themeMode: theme.mode,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      routerConfig: router,
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
