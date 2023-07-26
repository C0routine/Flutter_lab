import 'package:flutter/material.dart';
import 'package:flutterlab/app/app_color.dart';

class ExecuteTextButton extends StatelessWidget {
  const ExecuteTextButton({super.key, required this.executeText, required this.onPress});

  final String executeText;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return AppColor.lightSubBackground;
        }),
      ),
      onPressed: () => onPress(),
      child: Text(executeText, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
