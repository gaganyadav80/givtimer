part of 'pomodoro_cubit.dart';

class PomodoroState extends Equatable {
  const PomodoroState({
    this.breakDuration = 5,
    this.longBreakDuration = 15,
    this.setsCount = 4,
    this.focusDuration = 25,
    this.activityName = '',
    this.totalTimeDone = 0,
    this.activityKey = '',
  });

  final double focusDuration;
  final double breakDuration;
  final double longBreakDuration;
  final double setsCount;

  // Values to keep
  final String activityName;
  final String activityKey;
  final double totalTimeDone;

  @override
  List<Object> get props => [
        focusDuration,
        breakDuration,
        longBreakDuration,
        setsCount,
        activityName,
        totalTimeDone,
        activityKey,
      ];

  PomodoroState copyWith({
    double? focusDuration,
    double? breakDuration,
    double? longBreakDuration,
    double? setsCount,
    String? activityName,
    double? totalTimeDone,
    String? activityKey,
  }) {
    return PomodoroState(
      focusDuration: focusDuration ?? this.focusDuration,
      breakDuration: breakDuration ?? this.breakDuration,
      longBreakDuration: longBreakDuration ?? this.longBreakDuration,
      setsCount: setsCount ?? this.setsCount,
      activityName: activityName ?? this.activityName,
      totalTimeDone: totalTimeDone ?? this.totalTimeDone,
      activityKey: activityKey ?? this.activityKey,
    );
  }
}
