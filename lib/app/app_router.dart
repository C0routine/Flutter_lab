import 'package:flutter/material.dart';
import 'package:flutterlab/widgets/state_management/bloc/counter/view/counter_page.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterlab/tab/dart_route.dart';
import 'package:flutterlab/tab/flutter_route.dart';
import 'package:flutterlab/tab/state_management_route.dart';
import 'package:flutterlab/tab/root_route_bottom_navigation_bar.dart';

import 'package:flutterlab/widgets/flutter/firebase_analytics_lab.dart';
import 'package:flutterlab/widgets/flutter/firebase_remote_config_lab.dart';
import 'package:flutterlab/widgets/flutter/flutter_bloc_lab.dart';
import 'package:flutterlab/widgets/flutter/layoutbuilder_lab.dart';
import 'package:flutterlab/widgets/flutter/skeleton_animation_lab.dart';
import 'package:flutterlab/widgets/flutter/statefulwidget_lab.dart';
import 'package:flutterlab/widgets/flutter/valuenotifier_lab.dart';
import 'package:flutterlab/widgets/flutter/change_notifier_lab.dart';
import 'package:flutterlab/widgets/flutter/inherited_widget_lab.dart';

import 'package:flutterlab/widgets/dart/singletons_lab.dart';
import 'package:flutterlab/widgets/dart/keywords.dart';

import 'package:flutterlab/widgets/state_management/bloc/bloc_main.dart';
import 'package:flutterlab/widgets/state_management/getx/getx_main.dart';
import 'package:flutterlab/widgets/state_management/provider/provider_main.dart';

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
  flutterBloc(path: '/flutter/flutterBloc'),
  firebaseAnalytics(path: '/flutter/firebaseAnalytics'),
  firebaseRemoteConfig(path: '/flutter/firebaseRemoteConfig'),

  // dart routes
  dart(path: '/dart'),
  keywords(path: '/dart/keywords'),
  singletons(path: '/dart/singletons'),

  // State Management Routes
  stateManagement(path: '/stateManagement'),
  // BLoC
  bloc(path: '/stateManagement/bloc'),
  cubitCounter(path: '/stateManagement/bloc/cubitCounter'),
  getX(path: '/stateManagement/getX'),
  provider(path: '/stateManagement/provider'),
  temp(path: '/tempPath');

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
        // Flutter
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
                appGoRoute(AppRouter.flutterBloc, const LabFlutterBloc()),
                appGoRoute(AppRouter.firebaseAnalytics, const LabFirebaseAnalytics()),
                appGoRoute(AppRouter.firebaseRemoteConfig, const LabFirebaseRemoteConfig()),
              ],
            ),
          ],
        ),

        // Dart
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

        // State Management
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouter.stateManagement.path,
              name: AppRouter.stateManagement.name,
              builder: (BuildContext context, GoRouterState state) => const StateManagement(),
              routes: [
                appGoRoute(
                  AppRouter.bloc,
                  const StateBlocMain(),
                  routes: [
                    appGoRoute(AppRouter.cubitCounter, const CounterPage()),
                  ],
                ),
                appGoRoute(
                  AppRouter.getX,
                  const StateGetXMain(),
                  routes: [],
                ),
                appGoRoute(
                  AppRouter.provider,
                  const StateProviderMain(),
                  routes: [],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
