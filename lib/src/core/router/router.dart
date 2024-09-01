import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:martva/src/core/utils/messaging/talker.dart';
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
import 'package:martva/src/features/tickets/view/exam_screen/exam.screen.dart';
import 'package:martva/src/features/tickets/view/ticket_list_screen/ticket_list.screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authServiceProvider);

  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: '/',
    observers: [
      BotToastNavigatorObserver(),
      TalkerRouteObserver(talker),
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

@TypedGoRoute<TicketsRoute>(path: '/tickets')
class TicketsRoute extends GoRouteData {
  const TicketsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TicketsScreen();
  }
}

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

@TypedGoRoute<DevDebugTalkerRoute>(path: '/dev/debug-talker')
class DevDebugTalkerRoute extends GoRouteData {
  const DevDebugTalkerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TalkerScreen(talker: talker);
  }
}

@TypedGoRoute<DevDebugDbSeederRoute>(path: '/dev/db-seeder')
class DevDebugDbSeederRoute extends GoRouteData {
  const DevDebugDbSeederRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DbSeederScreen();
  }
}
