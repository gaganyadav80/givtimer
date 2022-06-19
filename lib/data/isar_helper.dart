import 'package:givtimer/data/data.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:isar/isar.dart';

class IsarHelper {
  factory IsarHelper() => _shared;
  IsarHelper._sharedInstance();
  static final IsarHelper _shared = IsarHelper._sharedInstance();

  late final Isar isar;
  String? userId;

  Future<void> createActivity(
    ActivityType type,
    String activityKey,
    int seconds,
  ) async {
    try {
      var data = await isar.dailyActivityDatas
          .where()
          .userIdKeyEqualTo(userId!, activityKey)
          .filter()
          .dateEqualTo(DateTime.now().removeTime())
          .findFirst();

      if (data != null) {
        data.seconds += seconds;
      } else {
        data = DailyActivityData()
          ..userId = userId!
          ..date = DateTime.now().removeTime()
          ..key = activityKey
          ..seconds = seconds
          ..type = type;
      }

      var dailyTotal = await isar.dailyProductiveTimes
          .where()
          .userIdEqualTo(userId!)
          .filter()
          .dateEqualTo(DateTime.now().removeTime())
          .findFirst();

      if (dailyTotal != null) {
        dailyTotal.seconds += seconds;
      } else {
        dailyTotal = DailyProductiveTime()
          ..userId = userId!
          ..date = DateTime.now().removeTime()
          ..seconds = seconds;
      }

      await isar.writeTxn<void>((Isar _isar) async {
        await _isar.dailyActivityDatas.put(data!, replaceOnConflict: true);
        await _isar.dailyProductiveTimes
            .put(dailyTotal!, replaceOnConflict: true);
        await _isar.activityLogs.put(
          ActivityLog()
            ..userId = userId!
            ..date = DateTime.now()
            ..key = activityKey
            ..seconds = seconds
            ..type = type,
          replaceOnConflict: true,
        );
      });

      await HiveHelper().addActivitySet(activityKey, seconds);
      //
    } on Exception catch (e) {
      throw Exception('Failed to create activity: $e');
    }
  }

  Future<List<DailyActivityData>> getActivityByKey(String key) async {
    try {
      final history = isar.txn<List<DailyActivityData>>(
        (_isar) async {
          final data = await _isar.dailyActivityDatas
              .where()
              .userIdKeyEqualTo(userId!, key)
              .sortByDateDesc()
              .findAll();

          return data;
        },
      );

      return history;
    } on Exception catch (e) {
      throw Exception('Failed to get activity history by name: $e');
    }
  }

  Future<List<ActivityLog>> getAllLogs() async {
    try {
      final history = isar.txn<List<ActivityLog>>(
        (_isar) async {
          final data = await _isar.activityLogs
              .where()
              .userIdEqualTo(userId!)
              .sortByDateDesc()
              .findAll();

          return data;
        },
      );

      return history;
    } on Exception catch (e) {
      throw Exception('Failed to get activity history: $e');
    }
  }

  Future<List<DailyProductiveTime>> getAllDailyTotal() async {
    try {
      final dailyTotalList = isar.txn<List<DailyProductiveTime>>(
        (_isar) async {
          final data = await _isar.dailyProductiveTimes
              .where()
              .userIdEqualTo(userId!)
              .sortByDateDesc()
              .findAll();

          return data;
        },
      );

      return dailyTotalList;
    } on Exception catch (e) {
      throw Exception('Failed to get activity history: $e');
    }
  }
}
