// ignore_for_file: constant_identifier_names

import 'package:givtimer/data/data.dart';
import 'package:hive/hive.dart';

class DBHelper {
  factory DBHelper() => _shared;
  DBHelper._sharedInstance();
  static final DBHelper _shared = DBHelper._sharedInstance();

  late Box<Map<dynamic, dynamic>> activityDb;
  String? userId;

  static const String DB_ACTIVITY_DATA = 'DB_ACTIVITY_DATA';
  static const String KEY_TOTAL_TIME = 'KEY_TOTAL_TIME';

  bool get userDataExists => activityDb.get(userId) != null;

  Map<String, int> get userData =>
      Map<String, int>.from(activityDb.get(userId) ?? <String, int>{});

  int get userTotalSeconds => userData[KEY_TOTAL_TIME] ?? 0;

  Map<String, int> get userActivityTotal {
    final data = userData..removeWhere((key, value) => key == KEY_TOTAL_TIME);

    return data;
  }

  Future<void> initEmptyUserData() async {
    await activityDb.put(userId, <String, int>{KEY_TOTAL_TIME: 0});

    await IsarHelper().isar.writeTxn(
      (isar) {
        return isar.userActivitys.put(
          UserActivity()..userId = userId!,
          replaceOnConflict: true,
        );
      },
    );
  }

  Future<void> initUserData(String id) async {
    userId = id;
    IsarHelper().userId = id;

    if (!DBHelper().userDataExists) {
      await DBHelper().initEmptyUserData();
    }

    // AlarmModel().alarmActive =
    //     await IsarHelper().getActivityByType(ActivityType.alarm);
  }

  Future<void> addActivitySet(String name, int seconds) async {
    final data = userData;
    data[name] = (data[name] ?? 0) + seconds;
    data[KEY_TOTAL_TIME] = (data[KEY_TOTAL_TIME] ?? 0) + seconds;

    await activityDb.put(userId, data);
  }

  int getActivityTotalSeconds(String name) => userData[name] ?? 0;
}
