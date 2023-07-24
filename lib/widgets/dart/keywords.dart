import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_color.dart';

// extends, implements, with, mixin keyword
class LabKeywords extends StatelessWidget {
  const LabKeywords({super.key});

  @override
  Widget build(BuildContext context) {
    TextButton textButton(String text, VoidCallback callback) {
      return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return AppColor.lightSubBackground;
          }),
        ),
        // onPressed: () => callback,
        onPressed: callback,
        child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textButton('Extends', () => ExtendsExecute().extendsLog()),
              const SizedBox(height: 10),
              textButton('Implements', () => ImplementsExecute().implementsLog()),
              const SizedBox(height: 10),
              textButton('WithMixin', () => WithMixinExecute().withMixinLog()),
              const SizedBox(height: 10),
              textButton(
                  'AllKeywords',
                  () => AllKeywordsExecute()
                    ..extendsLog()
                    ..withMixinLog()
                    ..implementsLog()),
            ],
          ),
        ),
      ),
    );
  }
}

// extends keyword 실행
class ExtendsExecute extends ExtendsClass {
  ExtendsExecute() {
    print('ExtendsExecute Create');
  }
}

// extends 할 class
class ExtendsClass {
  ExtendsClass() {
    print('ExtendsClass Create');
  }

  // extends 될 경우 실행될 메서드
  void extendsLog() {
    print('ExtendsClass Function extendsLog()');
  }
}

// implements keyword 실행
class ImplementsExecute implements ImplementsClass {
  ImplementsExecute() {
    print('ImplementsExecute Create');
  }

  // ImplementsClass 에서 추상화 되어 있는 implementsLog 함수를 구현.
  @override
  void implementsLog() {
    print('ImplementsExecute override Function implementsLog()');
  }
}

// implements 할 class
abstract class ImplementsClass {
  ImplementsClass() {
    print('ImplementsClass Create');
  }

  // implements 될 경우 실행될 메서드
  void implementsLog() {
    print('ImplementsClass Function implementsLog()');
  }
}

// with keyword 실행 (mixin class 만 가능)
class WithMixinExecute with WithMixinClass {
  WithMixinExecute() {
    print('WithExecute Create');
  }

  @override
  void withMixinLog() {
    // TODO: implement WithMixinLog
    print('WithExecute Function withMixinLog()');
    super.withMixinLog();
  }
}

// with 할 mixin class
mixin WithMixinClass {
  // with 될 경우 실행될 메서드
  void withMixinLog() {
    print('WithMixinClass Function withMixinLog()');
  }
}

// 정의한 class 모두 실행
class AllKeywordsExecute extends ExtendsClass with WithMixinClass implements ImplementsClass {
  AllKeywordsExecute() {
    print('AllKeywordsExecute Create');
  }

  @override
  void implementsLog() {
    print('AllKeywordsExecute override Function implementsLog()');
  }
}
