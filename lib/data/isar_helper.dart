import 'package:givtimer/data/data.dart';
import 'package:isar/isar.dart';

class IsarHelper {
  factory IsarHelper() => _shared;
  IsarHelper._sharedInstance();
  static final IsarHelper _shared = IsarHelper._sharedInstance();

  late final Isar isar;
  String? userId;

  DateTime get getDateNow =>
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  DateTime getDateBy(DateTime dtime) =>
      DateTime(dtime.year, dtime.month, dtime.day);

  Future<void> createActivity(
    ActivityType type,
    String name,
    int seconds,
  ) async {
    try {
      var data = await isar.dailyActivityDatas
          .where()
          .userIdNameEqualTo(userId!, name)
          .filter()
          .dateEqualTo(getDateNow)
          .findFirst();

      if (data != null) {
        data.seconds += seconds;
      } else {
        data = DailyActivityData()
          ..userId = userId!
          ..date = getDateNow
          ..name = name
          ..seconds = seconds
          ..type = type;
      }

      var dailyTotal = await isar.dailyProductiveTimes
          .where()
          .userIdEqualTo(userId!)
          .filter()
          .dateEqualTo(getDateNow)
          .findFirst();

      if (dailyTotal != null) {
        dailyTotal.seconds += seconds;
      } else {
        dailyTotal = DailyProductiveTime()
          ..userId = userId!
          ..date = getDateNow
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
            ..name = name
            ..seconds = seconds
            ..type = type,
          replaceOnConflict: true,
        );
      });

      await HiveHelper().addActivitySet(name, seconds);
      //
    } on Exception catch (e) {
      throw Exception('Failed to create activity: $e');
    }
  }

  Future<List<DailyActivityData>> getActivityByName(String name) async {
    try {
      final history = isar.txn<List<DailyActivityData>>(
        (_isar) async {
          final data = await _isar.dailyActivityDatas
              .where()
              .userIdNameEqualTo(userId!, name)
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
