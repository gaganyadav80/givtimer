// ignore_for_file: constant_identifier_names

import 'package:givtimer/data/data.dart';
import 'package:hive/hive.dart';

class DBHelper {
  factory DBHelper() => _shared;
  DBHelper._sharedInstance();
  static final DBHelper _shared = DBHelper._sharedInstance();

  late Box<Map<dynamic, dynamic>> db;
  late String userId;

  static const String DB_ACTIVITY_DATA = 'DB_ACTIVITY_DATA';
  static const String KEY_POMODORO = 'KEY_POMODORO';
  static const String KEY_TIMER = 'KEY_TIMER';
  static const String KEY_ALARM = 'KEY_ALARM';

  bool get userDataExists => db.get(userId) != null;
  Map<String, Map<dynamic, dynamic>> get userData =>
      Map<String, Map<dynamic, dynamic>>.from(
        db.get(userId) ?? <String, int>{},
      );

  Map<String, int> get pomodoroActivity =>
      Map<String, int>.from(userData[KEY_POMODORO] ?? <String, int>{});
  Map<String, int> get timerActivity =>
      Map<String, int>.from(userData[KEY_TIMER] ?? <String, int>{});
  Map<String, int> get alarmActivity =>
      Map<String, int>.from(userData[KEY_ALARM] ?? <String, int>{});

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

  Future<void> initUserData(String id) async {
    userId = id;

    if (!DBHelper().userDataExists) {
      await DBHelper().initEmptyUserData();
    }

    PomodoroModel().pomodoroActivity = DBHelper().pomodoroActivity;
    TimerModel().timerActivity = DBHelper().timerActivity;
    AlarmModel().alarmActivity = DBHelper().alarmActivity;
  }

  Future<void> addPomodoroSet(String name, int seconds) async {
    final pomodoroData = pomodoroActivity;
    pomodoroData[name] = (pomodoroData[name] ?? 0) + seconds;

    await db.put(userId, <String, Map<String, int>>{KEY_ALARM: pomodoroData});
  }

  Future<void> addTimerSet(String name, int seconds) async {
    final timerData = timerActivity;
    timerData[name] = (timerData[name] ?? 0) + seconds;

    await db.put(userId, <String, Map<String, int>>{KEY_TIMER: timerData});
  }

  Future<void> addAlarmSet(String name, int seconds) async {
    final alarmData = alarmActivity;
    alarmData[name] = (alarmData[name] ?? 0) + seconds;

    await db.put(userId, <String, Map<String, int>>{KEY_ALARM: alarmData});
  }
}
