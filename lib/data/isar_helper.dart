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
    int seconds, [
    DateTime? date,
  ]) async {
    try {
      await DBHelper().addActivitySet(name, seconds);
    } on Exception catch (e) {
      throw Exception('Failed to add activity to DB: $e');
    }

    try {
      await isar.writeTxn<void>((Isar _isar) async {
        final dataList = await _isar.userActivitys
            .where()
            .userIdEqualTo(userId!)
            .findFirst();

        await dataList!.data.load();
        await dataList.logs.load();

        final data = await dataList.data
            .filter()
            .dateEqualTo(getDateBy(date!)) // TODO(gagan): getDateNow
            .and()
            .nameEqualTo(name)
            .findFirst();

        if (data != null) {
          dataList.data.remove(data);
          data.seconds += seconds;
          dataList.data.add(data);
          // id = await _isar.userActivitys.put(data);
        } else {
          dataList.data.add(
            ActivityData()
              ..date = getDateBy(date) // TODO(gagan): getDateNow
              ..name = name
              ..seconds = seconds
              ..type = type,
          );
        }
        await dataList.data.save();

        dataList.logs.add(
          ActivityLogs()
            ..date = date
            ..name = name
            ..seconds = seconds
            ..type = type,
        );
        await dataList.logs.save();
      });
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

  // Future<List<ActivityData>> getActivityByType(ActivityType type) async {
  //   try {
  //     final history = isar.txn<List<ActivityData>>((isar) async {
  //       final data =
  //           await isar.userActivitys.where().userIdEqualTo(userId!).findFirst();

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
