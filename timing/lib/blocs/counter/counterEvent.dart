abstract class CounterEvent {}

class TimeStartEvent extends CounterEvent {
  int duration;
  TimeStartEvent({required this.duration});
}

class TimePauseEvent extends CounterEvent {}

class TimeResumeEvent extends CounterEvent {}


class TimeResetEvent extends CounterEvent {}

class TimeTickedEvent extends CounterEvent {
  int duration;
  TimeTickedEvent({required this.duration}); 
}
