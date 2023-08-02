import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_color.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class LabFirebaseAnalytics extends StatefulWidget {
  const LabFirebaseAnalytics({super.key});

  @override
  State<LabFirebaseAnalytics> createState() => _LabFirebaseAnalyticsState();
}

class _LabFirebaseAnalyticsState extends State<LabFirebaseAnalytics> {
  analyticsTestWidget(String text, Function onPress) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return AppColor.lightSubBackground;
        }),
      ),
      onPressed: () => onPress(),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
    );
  }

  Future<void> analyticsLogTest() async {
    await FirebaseAnalytics.instance.logEvent(
      name: 'log_test',
      parameters: {
        'test_item': "test",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              analyticsTestWidget('Analytics Log Test', analyticsLogTest),
            ],
          ),
        ),
      ),
    );
  }
}
