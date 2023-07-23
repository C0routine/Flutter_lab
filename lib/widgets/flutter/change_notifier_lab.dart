import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_color.dart';

/// ChangeNotifier TestValue Class
class LabChangeNotifierTestValue with ChangeNotifier {
  double _testValue = 0;

  double get testValue => _testValue;

  randomChange() {
    _testValue = (Random().nextDouble());
    notifyListeners();
  }
}

/// ChangeNotifier 와 ListenableBuilder
class LabChangeNotifier extends StatefulWidget {
  const LabChangeNotifier({super.key});

  @override
  State<LabChangeNotifier> createState() => _LabChangeNotifierState();
}

class _LabChangeNotifierState extends State<LabChangeNotifier> {
  @override
  Widget build(BuildContext context) {
    final LabChangeNotifierTestValue changeNotifier = LabChangeNotifierTestValue();

    print('LabChangeNotifier Widget Render');
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListenableBuilder(
                listenable: changeNotifier,
                builder: (BuildContext context, Widget? child) {
                  print('Only ListenableBuilder Render');
                  return Text('Current TestValue : ${changeNotifier.testValue}');
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return AppColor.lightSubBackground;
                  }),
                ),
                // testValue 값 Random 변경.
                onPressed: changeNotifier.randomChange,
                child: Text(
                  'TestValue Random Change',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
