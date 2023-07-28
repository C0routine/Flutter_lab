import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterlab/app/app_widget.dart';

class LabFlutterBloc extends StatelessWidget {
  const LabFlutterBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: BlocProvider(
            create: (_) => BlocBoxCubit(),
            child: const BlocBoxWidget(),
          ),
        ),
      ),
    );
  }
}

class BlocBoxCubit extends Cubit<double> {
  BlocBoxCubit() : super(10);

  increase() => emit(state + 1);

  decrease() => emit(state - 1);
}

class BlocBoxWidget extends StatelessWidget {
  const BlocBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('Render BlocBoxWidget');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<BlocBoxCubit, double>(
          builder: (BuildContext context, state) {
            print('Render BlocBuilder');
            return Text('Current Value : $state');
          },
        ),
        ExecuteTextButton(executeText: 'Increment', onPress: () => context.read<BlocBoxCubit>().increase()),
        ExecuteTextButton(executeText: 'Decrement', onPress: () => context.read<BlocBoxCubit>().decrease()),
      ],
    );
  }
}
