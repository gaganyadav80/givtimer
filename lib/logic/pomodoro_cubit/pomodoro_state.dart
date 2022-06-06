part of 'pomodoro_cubit.dart';

class PomodoroState extends Equatable {
  const PomodoroState({
    this.breakDuration = 5,
    this.longBreakDuration = 15,
    this.pomodoroCount = 4,
    this.pomodoroDuration = 25,
    this.activityName = '',
    this.totalTimeDone = 0,
    this.activityKey = '',
  });

  final double pomodoroDuration;
  final double breakDuration;
  final double longBreakDuration;
  final double pomodoroCount;

  // Values to keep
  final String activityName;
  final String activityKey;
  final double totalTimeDone;

  @override
  List<Object> get props => [
        pomodoroDuration,
        breakDuration,
        longBreakDuration,
        pomodoroCount,
        activityName,
        totalTimeDone,
        activityKey,
      ];

  PomodoroState copyWith({
    double? pomodoroDuration,
    double? breakDuration,
    double? longBreakDuration,
    double? pomodoroCount,
    String? activityName,
    double? totalTimeDone,
    String? activityKey,
  }) {
    return PomodoroState(
      pomodoroDuration: pomodoroDuration ?? this.pomodoroDuration,
      breakDuration: breakDuration ?? this.breakDuration,
      longBreakDuration: longBreakDuration ?? this.longBreakDuration,
      pomodoroCount: pomodoroCount ?? this.pomodoroCount,
      activityName: activityName ?? this.activityName,
      totalTimeDone: totalTimeDone ?? this.totalTimeDone,
      activityKey: activityKey ?? this.activityKey,
    );
  }
}
