// ignore_for_file: avoid_renaming_method_parameters

import 'package:isar/isar.dart';

enum ActivityType {
  pomodoro,
  timer,
  // alarm,
}

class ActivityTypeConverter extends TypeConverter<ActivityType, int> {
  const ActivityTypeConverter();

  @override
  ActivityType fromIsar(int activityTypeIndex) {
    return ActivityType.values[activityTypeIndex];
  }

  @override
  int toIsar(ActivityType activityType) {
    return activityType.index;
  }
}
