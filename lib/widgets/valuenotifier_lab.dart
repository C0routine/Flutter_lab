import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_color.dart';

/// ValueNotifier 와 ValueListenableBuilder
class LabValueNotifier extends StatefulWidget {
  const LabValueNotifier({super.key});

  @override
  State<LabValueNotifier> createState() => _LabValueNotifierState();
}

class _LabValueNotifierState extends State<LabValueNotifier> {
  // 단일 값 변경 알림, 값을 == 으로 확인하고 리스너에 알림.
  // 데이터 유형이 변경 불가능한 경우에만 사용하는것이 좋음.
  final ValueNotifier<int> testValue = ValueNotifier<int>(0);

  // Value Change
  testValueChange() {
    testValue.value = testValue.value+1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // testValue 가 변경되지 않음.
              Text('Init ValueNotifier : ${testValue.value}'),
              const SizedBox(height: 10),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    return AppColor.lightSubBackground;
                  }),
                ),
                // testValue 값 변경.
                onPressed: testValueChange,
                child: Text(
                  'ValueNotifier Increase',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 10),
              // testValue 가 변경될 때마다 빌드되므로 변경됨.
              ValueListenableBuilder(
                valueListenable: testValue,
                builder: (BuildContext context, value, Widget? child) {
                  return Text(
                    'ValueListenableBuilder ValueNotifier : $value',
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
