import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterlab/widgets/state_management/bloc/timer/bloc/timer_bloc.dart';

class TimerTextWidget extends StatelessWidget {
  const TimerTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    return Center(
      child: Text(
        duration < 10 ? '0$duration' : '$duration',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
