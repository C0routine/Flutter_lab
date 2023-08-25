import 'package:flutter_bloc/flutter_bloc.dart';

/// onError 는 addError method 로 error 발생을 알릴 수 있음.
/// onChange, onError 는 Cubit, Bloc instance 에서 동일하게 동작.
/// onEvent, onTransition 는 Bloc instance 에서 동작.
/// onEvent -> onTransition -> onChange 순으로 동작. (각 event 는 Local -> Global 순서로 동작)
class BlocStateObserver extends BlocObserver {
  // bloc observer
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event : ${bloc.runtimeType} $event');
  }

  // cubit, bloc state observer
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange : ${bloc.runtimeType} $change');
  }

  // cubit, bloc state observer
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('onError : ${bloc.runtimeType} $error $stackTrace');
  }

  // bloc observer
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition : ${bloc.runtimeType} $transition');
  }
}
