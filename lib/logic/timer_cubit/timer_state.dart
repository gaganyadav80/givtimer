part of 'timer_cubit.dart';

class TimerState extends Equatable {
  const TimerState({
    this.usePomodoro = false,
    this.breakDuration = 5,
    this.longBreakDuration = 15,
    this.pomodoroCount = 4,
    this.pomodoroDuration = 25,
  });

  final bool usePomodoro;
  final double pomodoroDuration;
  final double breakDuration;
  final double longBreakDuration;
  final double pomodoroCount;

  @override
  List<Object> get props => [
        usePomodoro,
        pomodoroDuration,
        breakDuration,
        longBreakDuration,
        pomodoroCount
      ];

  TimerState copyWith({
    bool? usePomodoro,
    double? pomodoroDuration,
    double? breakDuration,
    double? longBreakDuration,
    double? pomodoroCount,
  }) {
    return TimerState(
      usePomodoro: usePomodoro ?? this.usePomodoro,
      pomodoroDuration: pomodoroDuration ?? this.pomodoroDuration,
      breakDuration: breakDuration ?? this.breakDuration,
      longBreakDuration: longBreakDuration ?? this.longBreakDuration,
      pomodoroCount: pomodoroCount ?? this.pomodoroCount,
    );
  }
}
