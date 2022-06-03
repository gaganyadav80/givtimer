part of 'timer_cubit.dart';

class TimerState extends Equatable {
  const TimerState({this.duration = Duration.zero, this.seconds = 0});

  final Duration duration;
  final int seconds;

  @override
  List<Object> get props => [duration, seconds];

  TimerState copyWith({Duration? duration, int? seconds}) {
    return TimerState(
      duration: duration ?? this.duration,
      seconds: seconds ?? this.seconds,
    );
  }
}
