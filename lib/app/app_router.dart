import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterlab/tab/dart_route.dart';
import 'package:flutterlab/tab/flutter_route.dart';
import 'package:flutterlab/widgets/root_route_bottom_navigation_bar.dart';

/// AppRouter path, name 정의
enum AppRouter {
  // flutter routes
  flutter(path: '/flutter'),
  valueListenableBuilder(path: '/valueListenableBuilder'),

  // dart routes
  dart(path: '/dart');

  final String path;

  const AppRouter({required this.path});
}

final GoRouter routerConfig = GoRouter(
  initialLocation: '/flutter',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
        return RootRouteBottomNavigationBar(shell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouter.flutter.path,
              name: AppRouter.flutter.name,
              builder: (BuildContext context, GoRouterState state) {
                return const FlutterRoute();
              },
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouter.dart.path,
              name: AppRouter.dart.name,
              builder: (BuildContext context, GoRouterState state) {
                return const DartRoute();
              },
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
);
