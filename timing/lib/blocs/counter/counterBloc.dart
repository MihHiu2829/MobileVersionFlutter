import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeing/blocs/counter/counterEvent.dart';
import 'package:timeing/blocs/counter/counterState.dart';
import 'package:timeing/blocs/counter/ticker.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc({required Tick tick})
      : _tick = tick,
        super(TimeStartProgress(duration: _duration)) {
    on<TimeStartEvent>(_onStart);
    on<TimePauseEvent>(_onPause);
    on<TimeResetEvent>(_onReset);
    on<TimeResumeEvent>(_onResume);
    on<TimeTickedEvent>(_onTicked);  
    
  } 
  late Tick _tick;
  static int _duration = 120; // co the cau hinh, call api o day!
  StreamSubscription<int>? _streamSubscription;

  void _onStart(TimeStartEvent event, Emitter<CounterState> emit) {
    emit(TimeStartProgress(duration: event.duration));
    _streamSubscription?.cancel();
    _streamSubscription = _tick
        .tick(tick: event.duration)
        .listen((duration) => add(TimeTickedEvent(duration: duration)));
  }

  void _onPause(TimePauseEvent event, Emitter<CounterState> emit) {
    if (state is TimeInProgress) {
      _streamSubscription?.pause();
      emit(TimePauseProgress(duration: state.duration));
    }
  }

  void _onResume(TimeResumeEvent event, Emitter<CounterState> emit) {
    if (state is TimePauseProgress) {
      _streamSubscription?.resume();
      emit(TimeInProgress(duration: state.duration));
    }
  }

  void _onTicked(TimeTickedEvent event, Emitter<CounterState> emit) {
    emit(event.duration > 0
        ? TimeInProgress(duration: event.duration)
        : TimeCompleteProgress(duration: 0));
  }

  void _onReset(TimeResetEvent event, Emitter<CounterState> emit) {
    _streamSubscription?.cancel();
    emit(TimeStartProgress(duration: _duration));
  }
}
