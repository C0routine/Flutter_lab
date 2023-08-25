import 'package:flutter/material.dart';
import 'package:flutterlab/widgets/state_management/bloc/timer/view/view.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimerTextWidget(),
            TimerActionButton(),
          ],
        ),
      ),
    );
  }
}
