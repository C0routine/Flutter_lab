import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_color.dart';

class LabSingletons extends StatefulWidget {
  const LabSingletons({super.key});

  @override
  State<LabSingletons> createState() => _LabSingletonsState();
}

class _LabSingletonsState extends State<LabSingletons> {
  // Singleton Pattern Class Load, Hash Code, Change Value
  singletonValueLoad() {
    TestSingletons test = TestSingletons();
    print('First Singleton Load hashCode : ${test.hashCode}');

    TestSingletons.testValue = 'testValue Change, same Object';

    TestSingletons test2 = TestSingletons();
    print('Second Singleton Load hashCode : ${test2.hashCode}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return AppColor.lightSubBackground;
                  }),
                ),
                onPressed: () => singletonValueLoad(),
                child: Text(
                  'Click & Check Debug Print Log',
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

// Test 용 Singletons pattern
class TestSingletons {
  static final TestSingletons _testSingleTons = TestSingletons._init();

  // 이미 생성한 _testSingleTons 객체를 반환.
  factory TestSingletons() {
    print('Return TestSingletons Object, Current testValue : $testValue');
    return _testSingleTons;
  }

  TestSingletons._init() {
    print('Only One Initialized');
    testValue = 'init';
  }

  static String testValue = 'empty';
}
