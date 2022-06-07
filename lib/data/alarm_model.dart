import 'package:givtimer/data/db_helper.dart';

class AlarmModel {
  factory AlarmModel() => _shared;
  AlarmModel._sharedInstance();
  static final AlarmModel _shared = AlarmModel._sharedInstance();

  final Map<String, int> _alarmActivity = <String, int>{};

  Map<String, int> get alarmActivity => _alarmActivity;
  set alarmActivity(Map<String, int> value) => _alarmActivity
    ..clear()
    ..addAll(value);

  void addActivity(String name, int seconds) {
    _alarmActivity[name] = (_alarmActivity[name] ?? 0) + seconds;
    DBHelper().addAlarmSet(name, seconds);
  }

  int getActivityTime(String name) => _alarmActivity[name] ?? 0;
}
