import 'package:flutter/material.dart';
import 'package:flutterlab/widgets/flutter/layoutbuilder_lab.dart';
import 'package:flutterlab/widgets/flutter/skeleton_animation_lab.dart';
import 'package:flutterlab/widgets/flutter/statefulwidget_lab.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterlab/tab/dart_route.dart';
import 'package:flutterlab/tab/flutter_route.dart';
import 'package:flutterlab/tab/root_route_bottom_navigation_bar.dart';

import 'package:flutterlab/widgets/flutter/valuenotifier_lab.dart';
import 'package:flutterlab/widgets/flutter/change_notifier_lab.dart';
import 'package:flutterlab/widgets/flutter/inherited_widget_lab.dart';

import 'package:flutterlab/widgets/dart/singletons_lab.dart';
import 'package:flutterlab/widgets/dart/keywords.dart';

/// AppRouter path, name 정의
enum AppRouter {
  // flutter routes
  flutter(path: '/flutter'),
  valueNotifier(path: '/flutter/valueNotifier'),
  changeNotifier(path: '/flutter/changeNotifier'),
  inheritedWidget(path: '/flutter/inheritedWidget'),
  statefulWidget(path: '/flutter/statefulWidget'),
  layoutBuilder(path: '/flutter/layoutBuilder'),
  skeletonAnimation(path: '/flutter/skeletonAnimation'),

  // dart routes
  dart(path: '/dart'),
  keywords(path: '/dart/keywords'),
  singletons(path: '/dart/singletons');

  // navigation 에서만 사용, router 정의에는 사용하지 말것.
  final String path;

  const AppRouter({required this.path});
}

/// GoRouter routes 정의를 간단하게 하기 위한 메서드
GoRoute appGoRoute(AppRouter router, Widget routeWidget, {List<RouteBase>? routes}) {
  return GoRoute(
    path: router.name,
    name: router.name,
    builder: (BuildContext context, GoRouterState state) => routeWidget,
    routes: routes ?? [],
  );
}

final GoRouter routerConfig = GoRouter(
  initialLocation: AppRouter.flutter.path,
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
              builder: (BuildContext context, GoRouterState state) => const FlutterRoute(),
              routes: [
                appGoRoute(AppRouter.valueNotifier, const LabValueNotifier()),
                appGoRoute(AppRouter.changeNotifier, const LabChangeNotifier()),
                appGoRoute(AppRouter.inheritedWidget, const LabInheritedWidget()),
                appGoRoute(AppRouter.statefulWidget, const LabStatefulWidget()),
                appGoRoute(AppRouter.layoutBuilder, const LabLayoutBuilder()),
                appGoRoute(AppRouter.skeletonAnimation, const LabSkeletonAnimation()),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouter.dart.path,
              name: AppRouter.dart.name,
              builder: (BuildContext context, GoRouterState state) => const DartRoute(),
              routes: [
                appGoRoute(AppRouter.singletons, const LabSingletons()),
                appGoRoute(AppRouter.keywords, const LabKeywords()),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
