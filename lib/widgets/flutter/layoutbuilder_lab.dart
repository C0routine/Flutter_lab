import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_widget.dart';

/// LayoutBuilder Test
class LabLayoutBuilder extends StatefulWidget {
  const LabLayoutBuilder({super.key});

  @override
  State<LabLayoutBuilder> createState() => _LabLayoutBuilderState();
}

class _LabLayoutBuilderState extends State<LabLayoutBuilder> {
  // 초기 constraintsWidth 설정
  double constraintsWidth = 200;

  Widget bigWidthBuilder() {
    print('bigWidthBuilder');
    return Container(
      width: constraintsWidth,
      height: constraintsWidth,
      color: Colors.yellow,
      child: Center(
        child: ExecuteTextButton(
          executeText: 'Change Constraints',
          onPress: () => setState(() {
            // constraintsWidth 200 으로 설정
            constraintsWidth = 200;
          }),
        ),
      ),
    );
  }

  Widget normalWidthBuilder() {
    print('normalWidthBuilder');
    return Container(
      width: constraintsWidth,
      height: constraintsWidth,
      color: Colors.red,
      child: Center(
        child: ExecuteTextButton(
          executeText: 'Change Constraints',
          onPress: () => setState(() {
            // Current Device Width Size 로 변경.
            constraintsWidth = MediaQuery.of(context).size.width;
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          // Constraints 설정
          constraints: BoxConstraints(maxWidth: constraintsWidth),
          // 부모 widget constraints 변경, widget 이 처음 layout 될때,
          // 부모 widget 이 해당 widget 을 업데이트 할때
          // LayoutBuilder 의 builder 가 호출된다.
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              print('Current Constraints Width : ${constraints.maxWidth}');
              if (constraints.maxWidth > 200) {
                return bigWidthBuilder();
              }
              return normalWidthBuilder();
            },
          ),
        ),
      ),
    );
  }
}
