part of 'pomodoro_cubit.dart';

class PomodoroState extends Equatable {
  const PomodoroState({
    this.breakDuration = 5,
    this.longBreakDuration = 15,
    this.pomodoroCount = 4,
    this.pomodoroDuration = 25,
  });

  final double pomodoroDuration;
  final double breakDuration;
  final double longBreakDuration;
  final double pomodoroCount;

  @override
  List<Object> get props =>
      [pomodoroDuration, breakDuration, longBreakDuration, pomodoroCount];

  PomodoroState copyWith({
    double? pomodoroDuration,
    double? breakDuration,
    double? longBreakDuration,
    double? pomodoroCount,
  }) {
    return PomodoroState(
      pomodoroDuration: pomodoroDuration ?? this.pomodoroDuration,
      breakDuration: breakDuration ?? this.breakDuration,
      longBreakDuration: longBreakDuration ?? this.longBreakDuration,
      pomodoroCount: pomodoroCount ?? this.pomodoroCount,
    );
  }
}
