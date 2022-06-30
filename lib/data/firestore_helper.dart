// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/data/models/user_data.dart';
import 'package:givtimer/utils/utils.dart';

class FireDBHelper {
  factory FireDBHelper() => _shared;
  FireDBHelper._sharedInstance();
  static final FireDBHelper _shared = FireDBHelper._sharedInstance();

  final _firestore = FirebaseFirestore.instance;
  String? userId;

  late UserKeyTotalTime _userDataModel;

  late DocumentReference _userDataRef;
  late CollectionReference _activityLogsRef;
  late CollectionReference _dailyActivityRef;
  late CollectionReference _dailyTotalRef;

  static const String KEY_USER_DATA = 'KEY_USER_DATA';
  static const String KEY_TOTAL_TIME = 'KEY_TOTAL_TIME';
  static const String KEY_ACTIVITY_LOGS = 'KEY_ACTIVITY_LOGS';
  static const String KEY_DAILY_ACTIVITY = 'KEY_DAILY_ACTIVITY';
  static const String KEY_DAILY_TOTAL = 'KEY_DAILY_TOTAL';
  static const String KEY_NAME_TIME_MAP = 'KEY_NAME_TIME_MAP';

  // Future<Map<String, dynamic>?> get userData async {
  //   return (await _userDataRef.get()).data() as Map<String, dynamic>?;
  // }

  int get userTotalSeconds => _userDataModel.totalTime;

  Future<Map<String, int>> get userActivityTotalTimeData async =>
      _userDataModel.nameTimeMap;

  List<String> get userActivityKeys => _userDataModel.nameTimeMap.keys.toList();

  int getActivityTotalSeconds(String key) =>
      _userDataModel.nameTimeMap[key] ?? 0;

  void init(String id, {bool onSignUp = false}) {
    userId = id;
    log(userId.toString());
    _userDataRef = _firestore.collection(KEY_USER_DATA).doc(userId);
    _dailyActivityRef = _userDataRef.collection(KEY_DAILY_ACTIVITY);
    _dailyTotalRef = _userDataRef.collection(KEY_DAILY_TOTAL);
    _activityLogsRef = _userDataRef.collection(KEY_ACTIVITY_LOGS);

    if (onSignUp) {
      _userDataRef.set({
        KEY_TOTAL_TIME: 0,
        KEY_NAME_TIME_MAP: <String, int>{},
      });

      _userDataModel = UserKeyTotalTime();
    } else {
      _userDataRef.get().then((value) {
        final dataMap = Map<String, dynamic>.from((value.data() as Map?)!);
        log(dataMap.toString());
        _userDataModel = UserKeyTotalTime().fromMap(dataMap);
      });
    }
  }

  Future<void> _addDailyActivityData(
    ActivityType type,
    String activityKey,
    int seconds,
  ) async {
    try {
      final dataSnapshot = await _dailyActivityRef
          .where(
            'date',
            isEqualTo: Timestamp.fromDate(DateTime.now().removeTime()),
          )
          .where('key', isEqualTo: activityKey)
          .limit(1)
          .get();

      final QueryDocumentSnapshot<Object?>? dataRef;
      if (dataSnapshot.docs.isNotEmpty) {
        dataRef = dataSnapshot.docs.first;
      } else {
        dataRef = null;
      }

      if (dataRef != null) {
        final initSeconds =
            (dataRef.data() as Map<String, dynamic>?)!['seconds'] as int;
        await _dailyActivityRef
            .doc(dataRef.id)
            .update({'seconds': initSeconds + seconds});
      } else {
        await _dailyActivityRef.add(
          DailyActivityData(
            date: DateTime.now().removeTime(),
            seconds: seconds,
            key: activityKey,
            type: type,
          ).toMap(),
        );
      }
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  Future<void> _addDailyTotalData(int seconds) async {
    try {
      final dataSnapshot = await _dailyTotalRef
          .where(
            'date',
            isEqualTo: Timestamp.fromDate(DateTime.now().removeTime()),
          )
          .limit(1)
          .get();

      final QueryDocumentSnapshot<Object?>? dataRef;
      if (dataSnapshot.docs.isNotEmpty) {
        dataRef = dataSnapshot.docs.first;
      } else {
        dataRef = null;
      }

      if (dataRef != null) {
        final initSeconds =
            (dataRef.data() as Map<String, dynamic>?)!['seconds'] as int;
        await _dailyTotalRef
            .doc(dataRef.id)
            .update({'seconds': initSeconds + seconds});
      } else {
        await _dailyTotalRef.add(
          DailyProductiveTime(
            date: DateTime.now().removeTime(),
            seconds: seconds,
          ).toMap(),
        );
      }
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  Future<void> _addUserTotalTime(String key, int seconds) async {
    try {
      await _userDataRef
          .update({KEY_TOTAL_TIME: _userDataModel.totalTime + seconds});

      final totalTimeMap = _userDataModel.nameTimeMap;
      totalTimeMap[key] = (totalTimeMap[key] ?? 0) + seconds;
      await _userDataRef.update({KEY_NAME_TIME_MAP: totalTimeMap});

      _userDataModel
        ..totalTime = _userDataModel.totalTime + seconds
        ..nameTimeMap = totalTimeMap;
      //
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  Future<void> createActivity(
    ActivityType type,
    String activityKey,
    int seconds,
  ) async {
    await _addDailyActivityData(type, activityKey, seconds);
    await _addDailyTotalData(seconds);
    await _activityLogsRef.add(
      ActivityLog(
        date: DateTime.now(),
        type: type,
        key: activityKey,
        seconds: seconds,
      ).toMap(),
    );
    await _addUserTotalTime(activityKey, seconds);
  }

  Future<List<DailyActivityData>> getAllActivityByKey(String key) async {
    try {
      final snapshot =
          await _dailyActivityRef.where('key', isEqualTo: key).get();
      return snapshot.docs
          .map(
            (e) => DailyActivityData.fromMap(e.data()! as Map<String, dynamic>),
          )
          .toList();
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<ActivityLog>> getAllLogs() async {
    try {
      final snapshot =
          await _activityLogsRef.orderBy('date', descending: true).get();
      return snapshot.docs
          .map((e) => ActivityLog.fromMap(e.data()! as Map<String, dynamic>))
          .toList();
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<DailyProductiveTime>> getAllDailyTotal() async {
    try {
      final snapshot =
          await _dailyTotalRef.orderBy('date', descending: true).get();
      return snapshot.docs
          .map(
            (e) =>
                DailyProductiveTime.fromMap(e.data()! as Map<String, dynamic>),
          )
          .toList();
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
