// ignore_for_file: sort_constructors_first

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

/// `this` collection stores accumulated time of all the activities performed
/// daily. This will help to store the `productive` time each day utilised
/// by the user each day and a graph could be shown for that data.
class DailyProductiveTime extends Equatable {
  const DailyProductiveTime({required this.date, this.seconds = 0});

  final DateTime date;
  final int seconds;

  DailyProductiveTime copyWith({
    DateTime? date,
    int? seconds,
  }) {
    return DailyProductiveTime(
      date: date ?? this.date,
      seconds: seconds ?? this.seconds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': Timestamp.fromDate(date),
      'seconds': seconds,
    };
  }

  factory DailyProductiveTime.fromMap(Map<String, dynamic> map) {
    return DailyProductiveTime(
      date: (map['date'] as Timestamp).toDate(),
      seconds: (map['seconds'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyProductiveTime.fromJson(String source) =>
      DailyProductiveTime.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DailyProductiveTime(date: $date, seconds: $seconds)';

  @override
  List<Object> get props => [date, seconds];
}
