part of 'pomodoro_cubit.dart';

class PomodoroState extends Equatable {
  const PomodoroState({
    this.breakDuration = 5,
    this.longBreakDuration = 15,
    this.setsCount = 4,
    this.focusDuration = 25,
    this.activityName = '',
    // this.totalSecondsDone = 0,
    // this.activityKey = '',
  });

  final double focusDuration;
  final double breakDuration;
  final double longBreakDuration;
  final double setsCount;

  final String activityName;
  // final String activityKey;
  // final int totalSecondsDone;

  @override
  List<Object> get props => [
        focusDuration,
        breakDuration,
        longBreakDuration,
        setsCount,
        activityName,
        // totalSecondsDone,
        // activityKey,
      ];

  PomodoroState copyWith({
    double? focusDuration,
    double? breakDuration,
    double? longBreakDuration,
    double? setsCount,
    String? activityName,
    // int? totalSecondsDone,
    // String? activityKey,
  }) {
    return PomodoroState(
      focusDuration: focusDuration ?? this.focusDuration,
      breakDuration: breakDuration ?? this.breakDuration,
      longBreakDuration: longBreakDuration ?? this.longBreakDuration,
      setsCount: setsCount ?? this.setsCount,
      activityName: activityName ?? this.activityName,
      // totalSecondsDone: totalSecondsDone ?? this.totalSecondsDone,
      // activityKey: activityKey ?? this.activityKey,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'focusDuration': focusDuration,
      'breakDuration': breakDuration,
      'longBreakDuration': longBreakDuration,
      'setsCount': setsCount,
      // 'activityName': activityName,
      // 'activityKey': activityKey,
      // 'totalSecondsDone': totalSecondsDone,
    };
  }

  // ignore: sort_constructors_first
  factory PomodoroState.fromMap(Map<String, dynamic> map) {
    return PomodoroState(
      focusDuration: map['focusDuration'] as double,
      breakDuration: map['breakDuration'] as double,
      longBreakDuration: map['longBreakDuration'] as double,
      setsCount: map['setsCount'] as double,
      // activityName: map['activityName'] as String,
      // activityKey: map['activityKey'] as String,
      // totalSecondsDone: map['totalSecondsDone'] as int,
    );
  }
}
