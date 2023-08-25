import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutterlab/app/app_observer.dart';
import 'package:flutterlab/app/app_router.dart';
import 'package:flutterlab/app/app_theme.dart';
import 'package:flutterlab/app/app_firebase_options.dart';

void main() async {
  // BLoC Observer
  Bloc.observer = BlocStateObserver();

  // Firebase init
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const FlutterLab());
}

class FlutterLab extends StatelessWidget {
  const FlutterLab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      theme: AppTheme.light,
    );
  }
}
