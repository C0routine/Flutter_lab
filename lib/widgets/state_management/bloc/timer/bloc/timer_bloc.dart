import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterlab/widgets/state_management/bloc/timer/ticker.dart';

part 'timer_event.dart';

part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
    // Event Handler 등록
    // 해당 Event Receive -> 등록한 Function 실행.
    on<TimerStarted>(_onStarted);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
    on<_TimerTicked>(_onTicked);
  }

  final Ticker _ticker;
  static const int _duration = 60;

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    // TimerBloc 이 닫힐때 _tickerSubscription 를 취소.
    _tickerSubscription?.cancel();
    return super.close();
  }

  // Timer Start Event Receive -> Timer State Change RunProgress
  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    // TimerStarted Event 수신 -> state 변경.
    emit(TimerRunProgress(event.duration));

    // 이미 구독된 Stream cancel 하여 메모리 할당 해제.
    _tickerSubscription?.cancel();

    // _ticker.tick 스트림을 수신하고 매 틱마다 남은 시간을 _TimerTicked event 에 추가 (남은 시간)
    _tickerSubscription = _ticker.tick(ticks: event.duration).listen((duration) {
      add(_TimerTicked(duration: duration));
    });
  }

  // Timer Paused Event Receive -> if Current State is TimerRunProgress -> Pause
  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    // Current State TimerRunProgress Check
    if (state is TimerRunProgress) {
      // _tickerSubscription Stream 을 중지.
      _tickerSubscription?.pause();
      // 남은 Ticker 를 가지고 TimerRunPause State 로 변경.
      emit(TimerRunPause(state.duration));
    }
  }

  // Timer Resumed Event Receive -> if Current State is TimerRunPause -> Resume
  void _onResumed(TimerResumed event, Emitter<TimerState> emit) {
    // Current State is TimerRunPause Check
    if (state is TimerRunPause) {
      // _tickerSubscription Stream 을 재생.
      _tickerSubscription?.resume();
      // 남은 Ticker 를 가지고 TimerRunProgress State 로 변경.
      emit(TimerRunProgress(state.duration));
    }
  }

  // Timer Reset Event Receive -> Timer State Change TimerInitial
  void _onReset(TimerReset event, Emitter<TimerState> emit) {
    // 이미 구독된 Stream cancel 하여 메모리 할당 해제.
    _tickerSubscription?.cancel();
    // 내부 정의된 _duration 값으로 TimerInitial State 로 변경.
    emit(const TimerInitial(_duration));
  }

  // Timer Ticked Event Receive -> if Tick Zero State Change RunComplete - else State Change RunProgress
  void _onTicked(_TimerTicked event, Emitter<TimerState> emit) {
    emit(event.duration > 0 ? TimerRunProgress(event.duration) : const TimerRunComplete());
  }
}
