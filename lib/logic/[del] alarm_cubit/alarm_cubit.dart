// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:givtimer/data/data.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';

// part 'alarm_state.dart';

// class AlarmCubit extends HydratedCubit<AlarmState> {
//   AlarmCubit() : super(const AlarmState());

//   void setTime(TimeOfDay value) {
//     final timeNow = TimeOfDay.now();
//     int? hour;
//     int? minute;

//     if (value.hour < timeNow.hour) {
//       final remainingMin = 60 - timeNow.minute;
//       final remainingHour = 24 - timeNow.hour - 1;

//       hour = value.hour + remainingHour;
//       minute = value.minute + remainingMin;
//       //
//     } else if (value.hour == timeNow.hour && value.minute < timeNow.minute) {
//       hour = 23;
//       minute = 60 - (timeNow.minute - value.minute);
//       //
//     } else if (value.hour == timeNow.hour && value.minute > timeNow.minute) {
//       hour = 0;
//       minute = value.minute - timeNow.minute;
//       //
//     } else if (value.hour > timeNow.hour) {
//       final remainingMin = 60 - timeNow.minute;
//       hour = value.hour - timeNow.hour - 1;
//       minute = value.minute + remainingMin;
//       //
//     }

//     if (hour != null && minute != null && minute > 60) {
//       minute = minute % 60;
//       hour = hour + 1;
//     }
//     final helper = _getHelperFormattedString(hour, minute);
//     if (hour == null && minute == null) {
//       emit(state.copyWith(helperText: helper));
//     } else {
//       emit(state.copyWith(time: value, helperText: helper));
//     }
//   }

//   void setActivityName(String activityName) => emit(
//         state.copyWith(
//           activityName: activityName.trim(),
//           activityKey: activityName.trim().toLowerCase(),
//         ),
//       );

//   String _getHelperFormattedString([int? hour, int? minute]) {
//     if (hour == null || minute == null) {
//       return "Please don't select same time as now.";
//     } else if (hour == 0) {
//       return 'After $minute minute(s)';
//     }
//     return 'After $hour hour(s) and $minute minute(s)';
//   }

//   void setSelectedRingtoneIdx(int idx) => emit(
//         state.copyWith(selectedRingtoneIdx: idx),
//       );

//   void logActivity() {
//     // AlarmModel().addActivity(state.activityKey, timeOfDayInSeconds());
//     IsarHelper().createActivity(
//       ActivityType.alarm,
//       state.activityKey,
//       timeOfDayInSeconds(),
//     );
//   }

//   void addActiveAlarm(BuildContext context) {
//     final alarm = ActiveAlarm(
//       userId: IsarHelper().userId!,
//       date: IsarHelper().getDateNow,
//       name: state.activityKey,
//       time: state.time!.format(context),
//     );

//     final list = state.activeAlarmList;
//     list.add(alarm);
//     emit(state.copyWith(activeAlarmList: list));
//   }

//   int timeOfDayInSeconds() {
//     return state.time!.hour * 3600 + state.time!.minute * 60;
//   }

//   @override
//   AlarmState? fromJson(Map<String, dynamic> json) {
//     return AlarmState(
//       selectedRingtoneIdx: json['selectedRingtoneIdx'] as int,
//       activeAlarmList: List<ActiveAlarm>.from(
//         List<String>.from(json['alarmActive'] as List<dynamic>)
//             .map<ActiveAlarm>(ActiveAlarm.fromJson)
//             .toList(),
//       ),
//     );
//   }

//   @override
//   Map<String, dynamic>? toJson(AlarmState state) {
//     return <String, dynamic>{
//       'selectedRingtoneIdx': state.selectedRingtoneIdx,
//       'alarmActive': state.activeAlarmList.map((e) => e.toJson()).toList(),
//     };
//   }
// }
