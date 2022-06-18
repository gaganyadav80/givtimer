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
      // Step 1: Get all data for the current user
      // final dataList =
      //   await isar.userActivitys.where().userIdEqualTo(userId!).findFirst();

      // Load all the collections linked to user data
      // await dataList!.data.load();
      // await dataList.logs.load();
      // await dataList.daily.load();

      // Step 2: Check if the current activity exists for today
      // If exists then add these seconds to the existing activity for today
      // else create a new entry and add to the data.
      // final data = await dataList.data
      //     .filter()
      //     .dateEqualTo(getDateNow)
      //     .and()
      //     .nameEqualTo(name)
      //     .findFirst();

      var data = await isar.dailyActivityDatas
          .where()
          .userIdDateEqualTo(userId!, getDateNow)
          .filter()
          .nameEqualTo(name)
          .findFirst();

      if (data != null) {
        // dataList.data.remove(data);
        data.seconds += seconds;
        // dataList.data.add(data);
      } else {
        // dataList.data.add(
        data = DailyActivityData()
          ..userId = userId!
          ..date = getDateNow
          ..name = name
          ..seconds = seconds
          ..type = type;
        // );
      }

      // Step 3: Add this activity to logs collection
      // dataList.logs.add(
      //   ActivityLogs()
      //     ..date = DateTime.now()
      //     ..name = name
      //     ..seconds = seconds
      //     ..type = type,
      // );
      await isar.activityLogs.put(
        ActivityLog()
          ..date = DateTime.now()
          ..name = name
          ..seconds = seconds
          ..type = type,
      );

      // Step 4: Check if today's entry already exist in dailyTotal collection
      // If exists then add the seconds to existing activity
      // else create a new activity.
      // final dailyTotal =
      //     await dataList.daily.filter().dateEqualTo(getDateNow).findFirst();

      var dailyTotal = await isar.dailyProductiveTimes
          .where()
          .userIdDateEqualTo(userId!, getDateNow)
          .findFirst();

      if (dailyTotal != null) {
        // If have to remove the data with today's date for `this` user and
        // persist the changes before adding the seconds and replacing the
        // instance with updated data.
        //? The save method fixes the unique index violated exception.
        // dataList.daily.remove(dailyTotal);
        // await dataList.daily.save();

        dailyTotal.seconds += seconds;
        // dataList.daily.add(dailyTotal);
      } else {
        // dataList.daily.add(
        dailyTotal = DailyProductiveTime()
          ..userId = userId!
          ..date = getDateNow
          ..seconds = seconds;
        // );
      }

      // Step 5: Save all the linked collections data modifications.
      await isar.writeTxn<void>((Isar _isar) async {
        await _isar.dailyActivityDatas.put(data!, replaceOnConflict: true);
        await _isar.dailyProductiveTimes
            .put(dailyTotal!, replaceOnConflict: true);

        // await dataList.data.save();
        // await dataList.logs.save();
        // await dataList.daily.save();
      });

      // Step 6: Add to total time of this activity in hive db.
      await HiveHelper().addActivitySet(name, seconds);
      //
    } on Exception catch (e) {
      throw Exception('Failed to create activity: $e');
    }
  }

  Future<List<DailyActivityData>> getActivityByName(String name) async {
    try {
      final history = isar.txn<List<DailyActivityData>>(
        (isar) async {
          // final data = await isar.userActivitys
          //     .where()
          //     .userIdEqualTo(userId!)
          //     .findFirst();

          // if (data != null) {
          //   await data.data.load();

          //   return data.data
          //       .filter()
          //       .nameEqualTo(name)
          //       .sortByDateDesc()
          //       .findAll();
          // } else {
          //   return [];
          // }

          final data = await isar.dailyActivityDatas
              .where()
              .userIdEqualTo(userId!)
              .filter()
              .nameEqualTo(name)
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
        (isar) async {
          // final data = await isar.userActivitys
          //     .where()
          //     .userIdEqualTo(userId!)
          //     .findFirst();

          // if (data != null) {
          //   await data.logs.load();

          //   return data.logs.filter().sortByDateDesc().findAll();
          // } else {
          //   return [];
          // }
          final data = await isar.activityLogs
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
        (isar) async {
          // final data = await isar.userActivitys
          //     .where()
          //     .userIdEqualTo(userId!)
          //     .findFirst();

          // if (data != null) {
          //   await data.daily.load();

          //   return data.daily.filter().sortByDate().findAll();
          // } else {
          //   return [];
          // }

          final data = await isar.dailyProductiveTimes
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
