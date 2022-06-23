// ignore_for_file: sort_constructors_first, lines_longer_than_80_chars

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:givtimer/data/data.dart';

/// This collection stores the activity total time for EACH day.
/// If a activity is performed twice in a day then the total time will
/// be stored in a single entry. This collections has a SINGLE entry for each
/// activity per day
class DailyActivityData extends Equatable {
  const DailyActivityData({
    required this.date,
    required this.key,
    required this.type,
    this.seconds = 0,
  });

  final DateTime date;
  final String key;
  final ActivityType type;
  final int seconds;

  DailyActivityData copyWith({
    DateTime? date,
    String? key,
    ActivityType? type,
    int? seconds,
  }) {
    return DailyActivityData(
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

  factory DailyActivityData.fromMap(Map<String, dynamic> map) {
    return DailyActivityData(
      date: (map['date'] as Timestamp).toDate(),
      key: (map['key'] ?? '') as String,
      type: ActivityType.values[map['type'] as int],
      seconds: (map['seconds'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyActivityData.fromJson(String source) =>
      DailyActivityData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DailyActivityData(date: $date, key: $key, type: $type, seconds: $seconds)';
  }

  @override
  List<Object> get props => [date, key, type, seconds];
}
