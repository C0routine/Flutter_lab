import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterlab/widgets/state_management/bloc/timer/bloc/timer_bloc.dart';

class TimerActionButton extends StatelessWidget {
  const TimerActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final event = context.read<TimerBloc>();
    return BlocBuilder<TimerBloc, TimerState>(
      // Action Widget Render 방지
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (BuildContext context, TimerState state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...switch (state) {
              TimerInitial() => [
                  FloatingActionButton(
                    onPressed: () => context.read<TimerBloc>().add(TimerStarted(duration: state.duration)),
                    child: const Icon(Icons.play_arrow),
                  )
                ],
              TimerRunPause() => [
                  FloatingActionButton(
                    onPressed: () => event.add(const TimerResumed()),
                    child: const Icon(Icons.play_arrow),
                  ),
                  const SizedBox(width: 15),
                  FloatingActionButton(
                    onPressed: () => event.add(const TimerReset()),
                    child: const Icon(Icons.replay),
                  ),
                ],
              TimerRunProgress() => [
                  FloatingActionButton(
                    onPressed: () => event.add(const TimerPaused()),
                    child: const Icon(Icons.pause),
                  ),
                  const SizedBox(width: 15),
                  FloatingActionButton(
                    onPressed: () => event.add(const TimerReset()),
                    child: const Icon(Icons.replay),
                  ),
                ],
              TimerRunComplete() => [
                  FloatingActionButton(
                    onPressed: () => event.add(const TimerReset()),
                    child: const Icon(Icons.replay),
                  ),
                ],
            }
          ],
        );
      },
    );
  }
}
