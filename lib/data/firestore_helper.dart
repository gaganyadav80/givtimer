// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/utils/utils.dart';

class FireDBHelper {
  factory FireDBHelper() => _shared;
  FireDBHelper._sharedInstance();
  static final FireDBHelper _shared = FireDBHelper._sharedInstance();

  final _firestore = FirebaseFirestore.instance;
  late String? userId;
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
  // static const String KEY_USER_TOTAL_TIME = 'KEY_USER_TOTAL_TIME';

  Map<String, dynamic>? get userData {
    // return (await _userDataRef.get()).data() as Map<String, dynamic>?;
    Map<String, dynamic>? value;
    _userDataRef.get().then((snapshot) {
      value = snapshot.data() as Map<String, dynamic>?;
    });

    return value;
  }

  int get userTotalSeconds => (userData?[KEY_TOTAL_TIME] ?? 0) as int;

  Map<String, int> get userActivityTotalTimeData {
    Map<String, int>? value;
    _userDataRef.get().then((snapshot) {
      final temp = snapshot.data() as Map<String, dynamic>?;
      value = Map<String, int>.from(temp![KEY_NAME_TIME_MAP] as Map);
    });

    return value ?? {};
  }

  List<String> get userActivityKeys => userActivityTotalTimeData.keys.toList();

  int getActivityTotalSeconds(String key) =>
      userActivityTotalTimeData[key] ?? 0;

  void init(String id, {bool onSignUp = false}) {
    userId = id;
    _userDataRef = _firestore.collection(KEY_USER_DATA).doc(userId);
    _dailyActivityRef = _userDataRef.collection(KEY_DAILY_ACTIVITY);
    _dailyTotalRef = _userDataRef.collection(KEY_DAILY_TOTAL);
    _activityLogsRef = _userDataRef.collection(KEY_ACTIVITY_LOGS);

    if (onSignUp) {
      _userDataRef.set({
        KEY_TOTAL_TIME: 0,
        KEY_NAME_TIME_MAP: <String, int>{},
      });
    }
  }

  Future<void> _addDailyActivityData(
    ActivityType type,
    String activityKey,
    int seconds,
  ) async {
    final dataSnapshot = await _dailyActivityRef
        .where(
          'date',
          isEqualTo: Timestamp.fromDate(DateTime.now().removeTime()),
        )
        .where('key', isEqualTo: activityKey)
        .limit(1)
        .get();
    final dataRef = dataSnapshot.docs.first;

    if (dataRef.exists) {
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
  }

  Future<void> _addDailyTotalData(int seconds) async {
    final dataSnapshot = await _dailyTotalRef
        .where(
          'date',
          isEqualTo: Timestamp.fromDate(DateTime.now().removeTime()),
        )
        .limit(1)
        .get();
    final dataRef = dataSnapshot.docs.first;

    if (dataRef.exists) {
      final initSeconds =
          (dataRef.data() as Map<String, dynamic>?)!['seconds'] as int;
      await _dailyActivityRef
          .doc(dataRef.id)
          .update({'seconds': initSeconds + seconds});
    } else {
      await _dailyActivityRef.add(
        DailyProductiveTime(
          date: DateTime.now().removeTime(),
          seconds: seconds,
        ).toMap(),
      );
    }
  }

  Future<void> _addUserTotalTime(int seconds) async {
    await _userDataRef.update({KEY_TOTAL_TIME: userTotalSeconds + seconds});
  }

  Future<void> createActivity(
    ActivityType type,
    String activityKey,
    int seconds,
  ) async {
    try {
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
      await _addUserTotalTime(seconds);
      //
    } on Exception catch (e) {
      throw Exception('Failed to create activity: $e');
    }
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
      final snapshot = await _activityLogsRef.get();
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
