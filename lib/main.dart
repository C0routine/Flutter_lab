import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_router.dart';
import 'package:flutterlab/app/app_theme.dart';

void main() {
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

