import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:martva/src/core/utils/messaging/talker.dart';
import 'package:martva/src/features/auth/data/auth_service.dart';
import 'package:martva/src/features/auth/presentation/login_screen/login_screen.dart';
import 'package:martva/src/features/auth/presentation/signup_screen/signup_screen.dart';
import 'package:martva/src/features/auth/presentation/user_profile_screen/user_profile_screen.dart';
import 'package:martva/src/features/chat/domain/chat_service.dart';
import 'package:martva/src/features/chat/presentation/chat_list_screen.dart';
import 'package:martva/src/features/chat/presentation/chat_room_screen.dart';
import 'package:martva/src/features/home/presentation/main_screen.dart';
import 'package:martva/src/features/tickets/presentation/exam_screen/exam_screen.dart';
import 'package:martva/src/features/tickets/presentation/ticket_list_screen/ticket_list_screen.dart';
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
    return const MainScreen();
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

@TypedGoRoute<ExamRoute>(path: '/exam')
class ExamRoute extends GoRouteData {
  const ExamRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExamScreen();
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

@TypedGoRoute<TalkerRoute>(path: '/debug-talker')
class TalkerRoute extends GoRouteData {
  const TalkerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TalkerScreen(talker: talker);
  }
}
