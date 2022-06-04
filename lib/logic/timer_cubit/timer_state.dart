part of 'timer_cubit.dart';

class TimerState extends Equatable {
  const TimerState({
    this.duration = Duration.zero,
    this.seconds = 0,
    this.activityName = '',
  });

  final Duration duration;
  final int seconds;
  final String activityName;

  @override
  List<Object> get props => [duration, seconds, activityName];

  TimerState copyWith(
      {Duration? duration, int? seconds, String? activityName}) {
    return TimerState(
      duration: duration ?? this.duration,
      seconds: seconds ?? this.seconds,
      activityName: activityName ?? this.activityName,
    );
  }
}
