import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterlab/widgets/state_management/bloc/timer/ticker.dart';
import 'package:flutterlab/widgets/state_management/bloc/timer/bloc/timer_bloc.dart';
import 'package:flutterlab/widgets/state_management/bloc/timer/view/timer_view.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView(),
    );
  }
}
