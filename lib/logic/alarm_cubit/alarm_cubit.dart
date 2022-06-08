import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:givtimer/data/data.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'alarm_state.dart';

class AlarmCubit extends HydratedCubit<AlarmState> {
  AlarmCubit() : super(const AlarmState());

  void setTime(TimeOfDay value) {
    final timeNow = TimeOfDay.now();
    int? hour;
    int? minute;

    // TODO(gagan): or use seconds to get DateTime then get the difference
    if (value.hour < timeNow.hour) {
      final remainingMin = 60 - timeNow.minute;
      final remainingHour = 24 - timeNow.hour - 1;

      hour = value.hour + remainingHour;
      minute = value.minute + remainingMin;
      //
    } else if (value.hour == timeNow.hour && value.minute < timeNow.minute) {
      hour = 23;
      minute = 60 - (timeNow.minute - value.minute);
      //
    } else if (value.hour == timeNow.hour && value.minute > timeNow.minute) {
      hour = 0;
      minute = value.minute - timeNow.minute;
      //
    } else if (value.hour > timeNow.hour) {
      final remainingMin = 60 - timeNow.minute;
      hour = value.hour - timeNow.hour - 1;
      minute = value.minute + remainingMin;
      //
    }

    if (hour != null && minute != null && minute > 60) {
      minute = minute % 60;
      hour = hour + 1;
    }
    final helper = _getHelperFormattedString(hour, minute);

    emit(state.copyWith(time: value, helperText: helper));
  }

  void setActivityName(String activityName) => emit(
        state.copyWith(
          activityName: activityName.trim(),
          activityKey: activityName.trim().toLowerCase(),
        ),
      );

  String _getHelperFormattedString([int? hour, int? minute]) {
    if (hour == null || minute == null) {
      return "Please don't select same time as now";
    } else if (hour == 0) {
      return 'After $minute minute(s)';
    }
    return 'After $hour hour(s) and $minute minute(s)';
  }

  void setSelectedRingtoneIdx(int idx) => emit(
        state.copyWith(selectedRingtoneIdx: idx),
      );

  void logActivity(int seconds) {
    AlarmModel().addActivity(state.activityKey, timeOfDayInSeconds());
    state.alarmHistory.add({
      'activityName': state.activityName,
      'time': timeOfDayInSeconds().toString(),
      'date': DateTime.now().toString(),
    });
  }

  int timeOfDayInSeconds() {
    if (state.time == null) return 0;
    return state.time!.hour * 3600 + state.time!.minute * 60;
  }

  @override
  AlarmState? fromJson(Map<String, dynamic> json) {
    return AlarmState(
      selectedRingtoneIdx: json['selectedRingtoneIdx'] as int,
      alarmHistory: List<Map<String, String>>.from(
        (json['alarmHistory'] as List<Map<dynamic, dynamic>>)
            .map<Map<String, String>>(Map<String, String>.from),
      ),
    );
  }

  @override
  Map<String, dynamic>? toJson(AlarmState state) {
    return <String, dynamic>{
      'selectedRingtoneIdx': state.selectedRingtoneIdx,
      'alarmHistory': state.alarmHistory,
    };
  }
}
