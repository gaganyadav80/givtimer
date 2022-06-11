// import 'package:givtimer/data/collections/activity_type.dart';
// import 'package:givtimer/data/isar_helper.dart';

// class TimerModel {
//   factory TimerModel() => _shared;
//   TimerModel._sharedInstance();
//   static final TimerModel _shared = TimerModel._sharedInstance();

//   final Map<String, int> _timerActivity = <String, int>{};

//   Map<String, int> get timerActivity => _timerActivity;
//   set timerActivity(Map<String, int> value) => _timerActivity
//     ..clear()
//     ..addAll(value);

//   void addActivity(String name, int seconds) {
//     _timerActivity[name] = (_timerActivity[name] ?? 0) + seconds;
//     // DBHelper().addTimerSet(name, seconds);
//     // DBHelper().addActivityLog(DBHelper.KEY_TIMER, name, seconds);
//     IsarHelper().createActivity(ActivityType.timer, name, seconds);
//   }

//   int getActivityTime(String name) => _timerActivity[name] ?? 0;
// }
