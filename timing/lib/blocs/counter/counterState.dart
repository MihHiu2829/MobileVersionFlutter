import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  int duration;
  CounterState({required this.duration});  
  @override
  // TODO: implement props
  List<Object?> get props => [ duration ];
}

// ignore: must_be_immutable
class TimeInProgress extends CounterState{
  TimeInProgress({required super.duration});

}
class TimeStartProgress extends CounterState{
  TimeStartProgress({required super.duration});
}

class TimePauseProgress extends CounterState{
  TimePauseProgress({required super.duration});
}

class TimeCompleteProgress extends CounterState{
  TimeCompleteProgress({required super.duration});
}

