import 'package:givtimer/data/db_helper.dart';

class PomodoroModel {
  factory PomodoroModel() => _shared;
  PomodoroModel._sharedInstance();
  static final PomodoroModel _shared = PomodoroModel._sharedInstance();

  final Map<String, int> _pomodoroActivity = <String, int>{};

  void addActivity(String name, int seconds) {
    _pomodoroActivity[name] = (_pomodoroActivity[name] ?? 0) + seconds;
    DBHelper().addPomodoroSet(name, seconds);
  }

  int getActivityTime(String name) => _pomodoroActivity[name] ?? 0;
}
