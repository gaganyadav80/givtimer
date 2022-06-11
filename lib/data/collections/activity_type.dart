// ignore_for_file: avoid_renaming_method_parameters

import 'package:isar/isar.dart';

enum ActivityType {
  pomodoro,
  timer,
  // alarm,
}

extension FromString on String {
  ActivityType parseActivityType() {
    switch (this) {
      case 'ActivityType.pomodoro':
        return ActivityType.pomodoro;
      case 'ActivityType.timer':
        return ActivityType.timer;
      // case 'ActivityType.alarm':
      //   return ActivityType.alarm;
      default:
        throw Exception('Unknown ActivityType: $this');
    }
  }
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
