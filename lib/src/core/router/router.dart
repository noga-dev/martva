import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:martva/src/core/utils/messaging/logger.dart';
import 'package:martva/src/features/auth/repo/auth_service.dart';
import 'package:martva/src/features/auth/view/login_screen/login_screen.dart';
import 'package:martva/src/features/auth/view/signup_screen/signup_screen.dart';
import 'package:martva/src/features/auth/view/user_profile_screen/user_profile_screen.dart';
import 'package:martva/src/features/chat/dto/chat_service.dart';
import 'package:martva/src/features/chat/view/chat_list_screen.dart';
import 'package:martva/src/features/chat/view/chat_room_screen.dart';
import 'package:martva/src/features/dev/view/db_seeder.screen.dart';
import 'package:martva/src/features/home/view/home_screen.dart';
import 'package:martva/src/features/settings/view/settings_screen.dart';
import 'package:martva/src/features/srs/view/screens/flashcards.screen.dart';
import 'package:martva/src/features/tickets/view/screens/exam/exam.screen.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_details/ticket_details.screen.dart';
import 'package:martva/src/features/tickets/view/screens/ticket_list/ticket_list.screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authServiceProvider);

  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: '/',
    observers: [
      BotToastNavigatorObserver(),
    ],
    redirect: (context, state) {
      final isLoggedIn = authState != null;
      final isLoggingIn = state.matchedLocation == '/login';
      final isSigningUp = state.matchedLocation == '/signup';

      if (!isLoggedIn && !isLoggingIn && !isSigningUp) {
        return '/login';
      }

      if (isLoggedIn && (isLoggingIn || isSigningUp)) {
        return '/';
      }

      return null;
    },
    routes: $appRoutes,
  );
}

@TypedGoRoute<MainRoute>(path: '/')
class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedGoRoute<SignupRoute>(path: '/signup')
class SignupRoute extends GoRouteData {
  const SignupRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignupScreen();
  }
}

// tickets start
@TypedGoRoute<TicketsRoute>(
  path: '/tickets',
  routes: [
    TypedGoRoute<TicketDetailsRoute>(path: ':id'),
  ],
)
class TicketsRoute extends GoRouteData {
  const TicketsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TicketsScreen();
  }
}

class TicketDetailsRoute extends GoRouteData {
  const TicketDetailsRoute({
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TicketDetailScreen(
      ticketId: id,
    );
  }
}

// tickets end

@TypedGoRoute<ReviewsRoute>(path: '/reviews')
class ReviewsRoute extends GoRouteData {
  const ReviewsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FlashcardsScreen();
  }
}

@TypedGoRoute<ExamRoute>(path: '/exam')
class ExamRoute extends GoRouteData {
  const ExamRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExamScreen();
  }
}

@TypedGoRoute<SettingsRoute>(path: '/settings')
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}

// chat start

@TypedGoRoute<ChatRoute>(
  path: '/chat',
  routes: [
    TypedGoRoute<ChatRoomRoute>(path: ':type/:id'),
  ],
)
class ChatRoute extends GoRouteData {
  const ChatRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChatListScreen();
  }
}

class ChatRoomRoute extends GoRouteData {
  const ChatRoomRoute({
    required this.type,
    required this.id,
  });

  final ChatType type;
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChatRoomScreen(
      type: type,
      id: id,
      name: state.uri.queryParameters['name'] ?? 'Chat',
    );
  }
}

// chat end

@TypedGoRoute<UserProfileRoute>(path: '/profile')
class UserProfileRoute extends GoRouteData {
  const UserProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UserProfileScreen();
  }
}

@TypedGoRoute<StatisticsRoute>(path: '/stats')
class StatisticsRoute extends GoRouteData {
  const StatisticsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder();
  }
}

// @TypedGoRoute<DevDebugLoggerRoute>(path: '/dev/logger')
// class DevDebugLoggerRoute extends GoRouteData {
//   const DevDebugLoggerRoute();

//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return logger.;
//   }
// }

@TypedGoRoute<DevDebugDbSeederRoute>(path: '/dev/db-seeder')
class DevDebugDbSeederRoute extends GoRouteData {
  const DevDebugDbSeederRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DbSeederScreen();
  }
}

@TypedGoRoute<DevDebugLoggerRoute>(path: '/dev/logger')
class DevDebugLoggerRoute extends GoRouteData {
  const DevDebugLoggerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => logger.d(
              'Hello',
              error: Exception('ErrorXXX'),
              stackTrace: StackTrace.current,
            ),
            child: const Text('Log'),
          ),
        ],
      ),
    );
  }
}
