part of 'timer_cubit.dart';

class TimerState extends Equatable {
  const TimerState({
    this.duration = Duration.zero,
    this.seconds = 0,
    this.activityName = '',
    // this.activityKey = '',
  });

  final Duration duration;
  final int seconds;
  final String activityName;
  // final String activityKey;

  @override
  List<Object> get props => [duration, seconds, activityName];

  TimerState copyWith({
    Duration? duration,
    int? seconds,
    String? activityName,
    // String? activityKey,
  }) {
    return TimerState(
      duration: duration ?? this.duration,
      seconds: seconds ?? this.seconds,
      activityName: activityName ?? this.activityName,
      // activityKey: activityKey ?? this.activityKey,
    );
  }
}
