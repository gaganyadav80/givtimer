// ignore_for_file: sort_constructors_first, lines_longer_than_80_chars

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:givtimer/data/data.dart';

/// This collections stores the logs for the user of each activity performed
/// as per the Date and Time. If same activity is performed multiple times then
/// each of them will have a separate entry because the date will be same but
/// the time will be different for each activity.
///
/// Not usefull for anything but keeping it for now. Just for fun.
class ActivityLog extends Equatable {
  const ActivityLog({
    required this.date,
    required this.key,
    required this.type,
    this.seconds = 0,
  });

  final DateTime date;
  final String key;
  final ActivityType type;
  final int seconds;

  ActivityLog copyWith({
    DateTime? date,
    String? key,
    ActivityType? type,
    int? seconds,
  }) {
    return ActivityLog(
      date: date ?? this.date,
      key: key ?? this.key,
      type: type ?? this.type,
      seconds: seconds ?? this.seconds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': Timestamp.fromDate(date),
      'key': key,
      'type': type.index,
      'seconds': seconds,
    };
  }

  factory ActivityLog.fromMap(Map<String, dynamic> map) {
    return ActivityLog(
      date: (map['date'] as Timestamp).toDate(),
      key: (map['key'] ?? '') as String,
      type: ActivityType.values[map['type'] as int],
      seconds: map['seconds'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityLog.fromJson(String source) =>
      ActivityLog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ActivityLog(date: $date, key: $key, type: $type, seconds: $seconds)';
  }

  @override
  List<Object> get props => [date, key, type, seconds];
}
