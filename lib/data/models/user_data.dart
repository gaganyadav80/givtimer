// ignore_for_file: sort_constructors_first, prefer_const_constructors_in_immutables

class UserKeyTotalTime {
  int totalTime = 0;
  Map<String, int> nameTimeMap = {};

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'KEY_TOTAL_TIME': totalTime,
      'KEY_NAME_TIME_MAP': nameTimeMap,
    };
  }

  UserKeyTotalTime fromMap(Map<String, dynamic> map) {
    return UserKeyTotalTime()
      ..totalTime = (map['KEY_TOTAL_TIME'] ?? 0) as int
      ..nameTimeMap = Map<String, int>.from(map['KEY_NAME_TIME_MAP'] as Map);
  }

  @override
  String toString() =>
      'UserKeyTotalTime(totalTime: $totalTime, nameTimeMap: $nameTimeMap)';
}
