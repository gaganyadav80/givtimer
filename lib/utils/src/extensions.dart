import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Activity on String {
  // WORK @DSA ==> work-@dsa
  String toActivitykey() {
    return trim().toLowerCase().replaceAll(RegExp('  +'), '-');
  }

  // work-@dsa ==> WORK @DSA
  String toActivityname() {
    return toUpperCase().replaceAll('-', ' ');
  }

  String capitalizeFirst() {
    final words = trim().replaceAll('-', ' ').split(' ');
    for (var i = 0; i < words.length; i++) {
      words[i] = words[i][0].toUpperCase() + words[i].substring(1);
    }
    return words.join(' ');
  }
}

extension ActivityDate on DateTime {
  /// Changes [DateTime(1996, 24, 10, 17, 05)] to 'July 24, 1996 17:05'
  String format() {
    return DateFormat.yMMMd().add_Hm().format(this);
  }

  /// Changes [DateTime(1996, 06, 24, 17, 05)] to [DateTime(1996, 06, 24)]
  DateTime removeTime() {
    return DateTime(year, month, day);
  }
}

extension Routing on BuildContext {
  void pushMaterial(Widget widget) {
    Navigator.push<void>(this, MaterialPageRoute(builder: (_) => widget));
  }
}
