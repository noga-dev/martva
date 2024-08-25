// File: lib/core/router/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:martva/src/features/tickets/presentation/screens/ticket_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/notifiers/auth_notifier.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';

part 'router.r.g.dart';

@riverpod
class AuthStateListenable extends _$AuthStateListenable implements Listenable {
  VoidCallback? _listener;

  @override
  void addListener(VoidCallback listener) {
    _listener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _listener = null;
  }

  @override
  bool build() {
    ref.listen(authNotifierProvider, (_, __) {
      if (_listener != null) {
        _listener!();
      }
    });

    return true;
  }
}

@riverpod
GoRouter router(RouterRef ref) {
  final authStateListenable = ref.watch(authStateListenableProvider.notifier);

  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/ticket',
        builder: (context, state) => const TicketSolvingScreen(),
      ),
    ],
    redirect: (context, state) {
      // final authState = ref.read(authNotifierProvider);
      // final isLoggedIn = authState != null;
      // final isLoggingIn = state.matchedLocation == '/login';

      // if (!isLoggedIn && !isLoggingIn) return '/login';
      // if (isLoggedIn && isLoggingIn) return '/dashboard';
      return '/ticket';

      return null;
    },
    refreshListenable: authStateListenable,
  );
}
