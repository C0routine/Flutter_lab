import 'package:flutter/material.dart';

class LabInheritedWidget extends StatefulWidget {
  const LabInheritedWidget({super.key});

  @override
  State<LabInheritedWidget> createState() => _LabInheritedWidgetState();
}

class _LabInheritedWidgetState extends State<LabInheritedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
