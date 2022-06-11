// import 'package:givtimer/data/collections/activity_type.dart';
// import 'package:givtimer/data/isar_helper.dart';

// class PomodoroModel {
//   factory PomodoroModel() => _shared;
//   PomodoroModel._sharedInstance();
//   static final PomodoroModel _shared = PomodoroModel._sharedInstance();

//   final Map<String, int> _pomodoroActivity = <String, int>{};

//   Map<String, int> get pomodoroActivity => _pomodoroActivity;
//   set pomodoroActivity(Map<String, int> value) => _pomodoroActivity
//     ..clear()
//     ..addAll(value);

//   void addActivity(String name, int seconds) {
//     _pomodoroActivity[name] = (_pomodoroActivity[name] ?? 0) + seconds;
//     // DBHelper().addActivitySet(name, seconds);
//     // DBHelper().addActivityLog(DBHelper.KEY_POMODORO, name, seconds);
//     IsarHelper().createActivity(ActivityType.pomodoro, name, seconds);
//   }

//   int getActivityTime(String name) => _pomodoroActivity[name] ?? 0;
// }
