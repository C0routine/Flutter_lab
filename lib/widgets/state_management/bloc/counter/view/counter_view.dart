import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterlab/app/app_color.dart';
import 'package:flutterlab/widgets/state_management/bloc/counter/counter.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<CounterCubit, int>(
            builder: (BuildContext context, state) {
              return Text(
                'Current State : $state',
                style: Theme.of(context).textTheme.bodyLarge,
              );
            },
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FloatingActionButton(
            heroTag: 'FloatingActionButton - increment',
            onPressed: () => context.read<CounterCubit>().increment(),
            backgroundColor: AppColor.lightSubBackground,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 30),
          FloatingActionButton(
            heroTag: 'FloatingActionButton - decrement',
            onPressed: () => context.read<CounterCubit>().decrement(),
            backgroundColor: AppColor.lightSubBackground,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
