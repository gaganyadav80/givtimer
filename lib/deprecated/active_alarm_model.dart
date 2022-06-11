// // ignore_for_file: sort_constructors_first

// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class ActiveAlarm extends Equatable {
//   const ActiveAlarm({
//     required this.userId,
//     required this.date,
//     required this.name,
//     required this.time,
//   });

//   final String userId;
//   final DateTime date;
//   final String name;
//   final String time;

//   @override
//   List<Object> get props => [userId, date, name, time];

//   Map<String, String> toMap() {
//     return {
//       'userId': userId,
//       'date': date.toString(),
//       'name': name,
//       'time': time,
//     };
//   }

//   factory ActiveAlarm.fromMap(Map<String, dynamic> map) {
//     return ActiveAlarm(
//       userId: map['userId'] as String,
//       date: DateTime.parse(map['date'] as String),
//       name: map['name'] as String,
//       time: map['time'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ActiveAlarm.fromJson(String source) =>
//       ActiveAlarm.fromMap(json.decode(source) as Map<String, dynamic>);
// }
