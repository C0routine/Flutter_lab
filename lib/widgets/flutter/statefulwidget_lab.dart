import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_color.dart';

class LabStatefulWidget extends StatefulWidget {
  const LabStatefulWidget({super.key});

  @override
  State<LabStatefulWidget> createState() {
    print('createState');
    // 1. createState 를 먼저 호출, State 객체를 생성.
    return _LabStatefulWidgetState();
  }
}

class _LabStatefulWidgetState extends State<LabStatefulWidget> {
  double count = 0;

  @override
  void initState() {
    print('initState');
    // 2. State 객체가 생성된 후 호출, 초기화 작업
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    // 3. 해당 위젯이 의존하는 위젯이나 객체의 상태가 변경 되었을때 호출
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LabStatefulWidget oldWidget) {
    print('didUpdateWidget');
    // 새로운 속성으로 인해 부모 위젯이 재 빌드될때 build 호출
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate');
    // 6. widget tree 에서 제거 되기전 호출
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose');
    // 7. widget tree 에서 state object 가 제거될때 호출
    // 메모리 누수 방지를 위해 리소스를 해제, 취소하는 데 사용
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 4. 객체 변화에 따른 화면을 업데이트.
    print('build');
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
                onPressed: () => setState(() {
                  // state 객체가 변경되었음을 알려줌, build 를 다시 호출.
                  count += 1;
                }),
                child: Text(
                  'StatefulWidget LifeCycle : $count',
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
