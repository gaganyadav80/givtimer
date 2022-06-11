import 'package:givtimer/data/collections/activity.dart';
import 'package:givtimer/data/collections/activity_type.dart';
import 'package:givtimer/data/db_helper.dart';
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
      await DBHelper().addActivitySet(name, seconds);
    } on Exception catch (e) {
      throw Exception('Failed to add activity to DB: $e');
    }

    try {
      await isar.writeTxn<void>((Isar _isar) async {
        final dataList = await _isar.userActivitys
            .where()
            .nameDateEqualTo(name, getDateNow)
            .findAll();

        final data = dataList.isNotEmpty ? dataList.first : null;

        if (data != null) {
          data.seconds += seconds;
          await _isar.userActivitys.put(data);
        } else {
          await _isar.userActivitys.put(
            UserActivity()
              ..userId = userId!
              ..date = getDateNow
              ..name = name
              ..type = type
              ..seconds = seconds,
          );
        }
      });
    } on Exception catch (e) {
      throw Exception('Failed to create activity: $e');
    }
  }

  Future<List<UserActivity>> getActivityByType(ActivityType type) async {
    try {
      final history = isar.txn<List<UserActivity>>((isar) {
        return isar.userActivitys
            .where()
            .userIdTypeEqualTo(userId!, type)
            .sortByDateDesc()
            .findAll();
      });

      return history;
    } on Exception catch (e) {
      throw Exception('Failed to get activity history by type: $e');
    }
  }

  Future<List<UserActivity>> getAllActivity() async {
    try {
      final history = isar.txn<List<UserActivity>>(
        (isar) async => isar.userActivitys
            .where()
            .userIdEqualTo(userId!)
            .sortByDateDesc()
            .findAll(),
      );

      return history;
    } on Exception catch (e) {
      throw Exception('Failed to get activity history: $e');
    }
  }

  Future<List<UserActivity>> getActivityByName(String name) async {
    try {
      final history = isar.txn<List<UserActivity>>(
        (isar) async =>
            isar.userActivitys.where().nameEqualTo(name).sortByDate().findAll(),
      );

      return history;
    } on Exception catch (e) {
      throw Exception('Failed to get activity history by name: $e');
    }
  }
}
