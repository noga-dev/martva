import 'package:go_router/go_router.dart';
import 'package:martva/src/core/features/auth/auth_service.dart';
import 'package:martva/src/core/features/auth/login_screen.dart';
import 'package:martva/src/core/features/auth/presentation/user_profile_screen.dart';
import 'package:martva/src/core/features/auth/signup_screen.dart';
import 'package:martva/src/core/features/chat/presentation/chat_list_screen.dart';
import 'package:martva/src/core/features/chat/presentation/chat_room_screen.dart';
import 'package:martva/src/core/features/home/presentation/main_screen.dart';
import 'package:martva/src/core/features/tickets/presentation/screens/exam_screen.dart';
import 'package:martva/src/core/features/tickets/presentation/screens/tickets_screen.dart';
import 'package:martva/src/services/chat_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authServiceProvider);

  return GoRouter(
    initialLocation: '/',
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
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/tickets',
        builder: (context, state) => const TicketsScreen(),
      ),
      GoRoute(
        path: '/exam',
        builder: (context, state) => const ExamScreen(),
      ),
      GoRoute(
        path: '/chat',
        builder: (context, state) => const ChatListScreen(),
        routes: [
          GoRoute(
            path: ':type/:id',
            builder: (context, state) {
              final type = ChatType.values.firstWhere(
                (e) =>
                    e.toString() == 'ChatType.${state.pathParameters['type']}',
              );
              return ChatRoomScreen(
                type: type,
                id: state.pathParameters['id']!,
                name: state.uri.queryParameters['name'] ?? 'Chat',
              );
            },
          )
        ],
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const UserProfileScreen(),
      ),
    ],
  );
}
