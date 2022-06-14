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
      await isar.writeTxn<void>((Isar _isar) async {
        // Get all data for the current user
        final dataList = await _isar.userActivitys
            .where()
            .userIdEqualTo(userId!)
            .findFirst();

        // Load all the collections linked to user data
        await dataList!.data.load();
        await dataList.logs.load();
        await dataList.daily.load();

        // Step 1: Check if the current activity exists for today
        final data = await dataList.data
            .filter()
            .dateEqualTo(getDateNow)
            .and()
            .nameEqualTo(name)
            .findFirst();

        // If yes then add these seconds to the same activity for today
        // else add a new entry.
        if (data != null) {
          dataList.data.remove(data);
          data.seconds += seconds;
          dataList.data.add(data);
          // id = await _isar.userActivitys.put(data);
        } else {
          dataList.data.add(
            ActivityData()
              ..date = getDateNow
              ..name = name
              ..seconds = seconds
              ..type = type,
          );
        }

        // Add this activity to logs collection
        dataList.logs.add(
          ActivityLogs()
            ..date = DateTime.now()
            ..name = name
            ..seconds = seconds
            ..type = type,
        );

        // Now check if today's entry already exist in dailyTotal collection
        // If exists then add the seconds to existing activity
        // else create a new activity.
        final dailyTotal = dataList.daily.lookup(getDateNow);
        if (dailyTotal != null) {
          dataList.daily.remove(dailyTotal);
          dailyTotal.seconds += seconds;
          dataList.daily.add(dailyTotal);
        } else {
          dataList.daily.add(
            DailyTotal()
              ..date = getDateNow
              ..seconds = seconds,
          );
        }

        // Save all the linked collections data modifications.
        await dataList.data.save();
        await dataList.logs.save();
        await dataList.daily.save();
      });

      await DBHelper().addActivitySet(name, seconds);
    } on Exception catch (e) {
      throw Exception('Failed to create activity: $e');
    }
  }

  Future<List<ActivityData>> getActivityByName(String name) async {
    try {
      final history = isar.txn<List<ActivityData>>(
        (isar) async {
          final data = await isar.userActivitys
              .where()
              .userIdEqualTo(userId!)
              .findFirst();

          if (data != null) {
            await data.data.load();

            return data.data
                .filter()
                .nameEqualTo(name)
                .sortByDateDesc()
                .findAll();
          } else {
            return [];
          }
        },
      );

      return history;
    } on Exception catch (e) {
      throw Exception('Failed to get activity history by name: $e');
    }
  }

  Future<List<ActivityLogs>> getAllLogs() async {
    try {
      final history = isar.txn<List<ActivityLogs>>(
        (isar) async {
          final data = await isar.userActivitys
              .where()
              .userIdEqualTo(userId!)
              .findFirst();

          if (data != null) {
            await data.logs.load();

            return data.logs.filter().sortByDateDesc().findAll();
          } else {
            return [];
          }
        },
      );

      return history;
    } on Exception catch (e) {
      throw Exception('Failed to get activity history: $e');
    }
  }

  Future<List<DailyTotal>> getAllDailyTotal() async {
    try {
      final dailyTotalList = isar.txn<List<DailyTotal>>(
        (isar) async {
          final data = await isar.userActivitys
              .where()
              .userIdEqualTo(userId!)
              .findFirst();

          if (data != null) {
            await data.daily.load();

            return data.daily.filter().sortByDate().findAll();
          } else {
            return [];
          }
        },
      );

      return dailyTotalList;
    } on Exception catch (e) {
      throw Exception('Failed to get activity history: $e');
    }
  }

  // Future<List<ActivityData>> getActivityByType(ActivityType type) async {
  //   try {
  //     final history = isar.txn<List<ActivityData>>((isar) async {
  //       final data =
  //       await isar.userActivitys.where().userIdEqualTo(userId!).findFirst();

  //       if (data != null) {
  //         await data.data.load();

  //         return data.data.filter().typeEqualTo(type).findAll();
  //       } else {
  //         return [];
  //       }
  //     });

  //     return history;
  //   } on Exception catch (e) {
  //     throw Exception('Failed to get activity history by type: $e');
  //   }
  // }
}
