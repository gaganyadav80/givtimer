// ignore_for_file: sort_constructors_first

import 'package:equatable/equatable.dart';

class UserKeyTotalTime extends Equatable {
  UserKeyTotalTime({
    this.totalTime = 0,
    this.nameTimeMap,
  });

  final int totalTime;
  // TODO(gagan): instead use colletions and docs
  // because as the size will grow it will not be efficient to modify the map
  // as it is final and every operation requires to copy to a temporary map and then modify it.
  final Map<String, int>? nameTimeMap;

  UserKeyTotalTime copyWith({
    int? totalTime,
    Map<String, int>? nameTimeMap,
  }) {
    return UserKeyTotalTime(
      totalTime: totalTime ?? this.totalTime,
      nameTimeMap: nameTimeMap ?? this.nameTimeMap,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalTime': totalTime,
      'nameTimeMap': nameTimeMap,
    };
  }

  factory UserKeyTotalTime.fromMap(Map<String, dynamic> map) {
    return UserKeyTotalTime(
      totalTime: (map['totalTime'] ?? 0) as int,
      nameTimeMap: Map<String, int>.from(map['nameTimeMap'] as Map),
    );
  }

  @override
  String toString() =>
      'UserKeyTotalTime(totalTime: $totalTime, nameTimeMap: $nameTimeMap)';

  @override
  List<Object> get props => [totalTime, nameTimeMap!];
}
