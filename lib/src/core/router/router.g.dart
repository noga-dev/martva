// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainRoute,
      $loginRoute,
      $signupRoute,
      $ticketsRoute,
      $reviewsRoute,
      $examRoute,
      $settingsRoute,
      $chatRoute,
      $userProfileRoute,
      $statisticsRoute,
      $devDebugDbSeederRoute,
      $devDebugLoggerRoute,
    ];

RouteBase get $mainRoute => GoRouteData.$route(
      path: '/',
      factory: $MainRouteExtension._fromState,
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signupRoute => GoRouteData.$route(
      path: '/signup',
      factory: $SignupRouteExtension._fromState,
    );

extension $SignupRouteExtension on SignupRoute {
  static SignupRoute _fromState(GoRouterState state) => const SignupRoute();

  String get location => GoRouteData.$location(
        '/signup',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $ticketsRoute => GoRouteData.$route(
      path: '/tickets',
      factory: $TicketsRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: ':id',
          factory: $TicketDetailsRouteExtension._fromState,
        ),
      ],
    );

extension $TicketsRouteExtension on TicketsRoute {
  static TicketsRoute _fromState(GoRouterState state) => const TicketsRoute();

  String get location => GoRouteData.$location(
        '/tickets',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TicketDetailsRouteExtension on TicketDetailsRoute {
  static TicketDetailsRoute _fromState(GoRouterState state) =>
      TicketDetailsRoute(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/tickets/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $reviewsRoute => GoRouteData.$route(
      path: '/reviews',
      factory: $ReviewsRouteExtension._fromState,
    );

extension $ReviewsRouteExtension on ReviewsRoute {
  static ReviewsRoute _fromState(GoRouterState state) => const ReviewsRoute();

  String get location => GoRouteData.$location(
        '/reviews',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $examRoute => GoRouteData.$route(
      path: '/exam',
      factory: $ExamRouteExtension._fromState,
    );

extension $ExamRouteExtension on ExamRoute {
  static ExamRoute _fromState(GoRouterState state) => const ExamRoute();

  String get location => GoRouteData.$location(
        '/exam',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingsRoute => GoRouteData.$route(
      path: '/settings',
      factory: $SettingsRouteExtension._fromState,
    );

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $chatRoute => GoRouteData.$route(
      path: '/chat',
      factory: $ChatRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: ':type/:id',
          factory: $ChatRoomRouteExtension._fromState,
        ),
      ],
    );

extension $ChatRouteExtension on ChatRoute {
  static ChatRoute _fromState(GoRouterState state) => const ChatRoute();

  String get location => GoRouteData.$location(
        '/chat',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ChatRoomRouteExtension on ChatRoomRoute {
  static ChatRoomRoute _fromState(GoRouterState state) => ChatRoomRoute(
        type: _$ChatTypeEnumMap._$fromName(state.pathParameters['type']!),
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/chat/${Uri.encodeComponent(_$ChatTypeEnumMap[type]!)}/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$ChatTypeEnumMap = {
  ChatType.direct: 'direct',
  ChatType.group: 'group',
  ChatType.city: 'city',
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}

RouteBase get $userProfileRoute => GoRouteData.$route(
      path: '/profile',
      factory: $UserProfileRouteExtension._fromState,
    );

extension $UserProfileRouteExtension on UserProfileRoute {
  static UserProfileRoute _fromState(GoRouterState state) =>
      const UserProfileRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $statisticsRoute => GoRouteData.$route(
      path: '/stats',
      factory: $StatisticsRouteExtension._fromState,
    );

extension $StatisticsRouteExtension on StatisticsRoute {
  static StatisticsRoute _fromState(GoRouterState state) =>
      const StatisticsRoute();

  String get location => GoRouteData.$location(
        '/stats',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $devDebugDbSeederRoute => GoRouteData.$route(
      path: '/dev/db-seeder',
      factory: $DevDebugDbSeederRouteExtension._fromState,
    );

extension $DevDebugDbSeederRouteExtension on DevDebugDbSeederRoute {
  static DevDebugDbSeederRoute _fromState(GoRouterState state) =>
      const DevDebugDbSeederRoute();

  String get location => GoRouteData.$location(
        '/dev/db-seeder',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $devDebugLoggerRoute => GoRouteData.$route(
      path: '/dev/logger',
      factory: $DevDebugLoggerRouteExtension._fromState,
    );

extension $DevDebugLoggerRouteExtension on DevDebugLoggerRoute {
  static DevDebugLoggerRoute _fromState(GoRouterState state) =>
      const DevDebugLoggerRoute();

  String get location => GoRouteData.$location(
        '/dev/logger',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'8c57c38971b78a358053f7af4fc7c46f30f71d96';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
