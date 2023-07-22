import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterlab/tab/dart_route.dart';
import 'package:flutterlab/tab/flutter_route.dart';
import 'package:flutterlab/tab/root_route_bottom_navigation_bar.dart';
import 'package:flutterlab/widgets/flutter/valuenotifier_lab.dart';
import 'package:flutterlab/widgets/dart/singletons_lab.dart';

/// AppRouter path, name 정의
enum AppRouter {
  // flutter routes
  flutter(path: '/flutter'),
  valueNotifier(path: '/flutter/valueNotifier'),

  // dart routes
  dart(path: '/dart'),
  singletons(path: '/dart/singletons');

  // navigation 에서만 사용, router 정의에는 사용하지 말것.
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
              routes: [
                GoRoute(
                  path: AppRouter.valueNotifier.name,
                  name: AppRouter.valueNotifier.name,
                  builder: (BuildContext context, GoRouterState state) {
                    return const LabValueNotifier();
                  },
                ),
              ],
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
              routes: [
                GoRoute(
                  path: AppRouter.singletons.name,
                  name: AppRouter.singletons.name,
                  builder: (BuildContext context, GoRouterState state) {
                    return const LabSingletons();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
