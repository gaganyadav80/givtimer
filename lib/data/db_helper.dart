// ignore_for_file: constant_identifier_names

import 'package:hive/hive.dart';

class DBHelper {
  factory DBHelper() => _shared;
  DBHelper._sharedInstance();
  static final DBHelper _shared = DBHelper._sharedInstance();

  late Box<Map<String, Map<String, int>>> db;
  late String userId;

  static const String DB_ACTIVITY_DATA = 'DB_ACTIVITY_DATA';
  static const String KEY_POMODORO = 'KEY_POMODORO';
  static const String KEY_TIMER = 'KEY_TIMER';
  static const String KEY_ALARM = 'KEY_ALARM';

  bool get userDataExists => db.get(userId) != null;

  Future<void> initEmptyUserData() async {
    await db.put(
      userId,
      <String, Map<String, int>>{
        KEY_POMODORO: <String, int>{},
        KEY_TIMER: <String, int>{},
        KEY_ALARM: <String, int>{},
      },
    );
  }

  Future<void> addPomodoroSet(String name, int seconds) async {
    final userData = db.get(userId)!;
    final pomodoroData = userData[KEY_POMODORO] ?? <String, int>{};
    pomodoroData[name] = (pomodoroData[name] ?? 0) + seconds;

    await db.put(userId, <String, Map<String, int>>{KEY_ALARM: pomodoroData});
  }

  Future<void> addTimerSet(String name, int seconds) async {
    final userData = db.get(userId)!;
    final timerData = userData[KEY_TIMER] ?? <String, int>{};
    timerData[name] = (timerData[name] ?? 0) + seconds;

    await db.put(userId, <String, Map<String, int>>{KEY_TIMER: timerData});
  }

  Future<void> addAlarmSet(String name, int seconds) async {
    final userData = db.get(userId)!;
    final alarmData = userData[KEY_ALARM] ?? <String, int>{};
    alarmData[name] = (alarmData[name] ?? 0) + seconds;

    await db.put(userId, <String, Map<String, int>>{KEY_ALARM: alarmData});
  }
}
