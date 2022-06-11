// part of 'alarm_cubit.dart';

// class AlarmState extends Equatable {
//   const AlarmState({
//     this.time,
//     this.activityKey = '',
//     this.activityName = '',
//     this.helperText = '',
//     this.selectedRingtoneIdx = 0,
//     this.activeAlarmList = const [],
//   });

//   final TimeOfDay? time;
//   final String helperText;
//   final String activityName;
//   final String activityKey;
//   final int selectedRingtoneIdx;

//   final List<ActiveAlarm> activeAlarmList;

//   @override
//   List<Object?> get props => [
//         time,
//         helperText,
//         activityName,
//         activityKey,
//         selectedRingtoneIdx,
//         activeAlarmList,
//       ];

//   AlarmState copyWith({
//     TimeOfDay? time,
//     String? helperText,
//     String? activityName,
//     String? activityKey,
//     int? selectedRingtoneIdx,
//     List<ActiveAlarm>? activeAlarmList,
//   }) {
//     return AlarmState(
//       time: time ?? this.time,
//       helperText: helperText ?? this.helperText,
//       activityName: activityName ?? this.activityName,
//       activityKey: activityKey ?? this.activityKey,
//       selectedRingtoneIdx: selectedRingtoneIdx ?? this.selectedRingtoneIdx,
//       activeAlarmList: activeAlarmList ?? this.activeAlarmList,
//     );
//   }
// }
