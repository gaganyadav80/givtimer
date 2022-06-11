import 'package:givtimer/data/data.dart';

class AlarmModel {
  factory AlarmModel() => _shared;
  AlarmModel._sharedInstance();
  static final AlarmModel _shared = AlarmModel._sharedInstance();

  final List<UserActivity> _alarmActivity = <UserActivity>[];

  List<UserActivity> get alarmActivity => _alarmActivity;
  set alarmActivity(List<UserActivity> value) => _alarmActivity
    ..clear()
    ..addAll(value);
}
