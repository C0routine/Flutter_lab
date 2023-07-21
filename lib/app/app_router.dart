import 'package:flutter/material.dart';
import 'package:flutterlab/app/dart_route.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterlab/app/flutter_route.dart';
import 'package:flutterlab/widgets/root_route_bottom_navigation_bar.dart';

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
              path: '/flutter',
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
              path: '/dart',
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
