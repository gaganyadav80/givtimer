import 'package:flutter/material.dart';

// enum FormzStatus {
//   initial,
//   submissionInProgress,
//   googleInProgress,
//   success,
//   failure,
// }

final BorderRadius kBorderRadius = BorderRadius.circular(kDefaultRadius);

const double kDefaultRadius = 8;

final OutlineInputBorder kInputBorderStyle = OutlineInputBorder(
  borderRadius: kBorderRadius,
  borderSide: const BorderSide(
    // color: Colors.grey[400]!,
    color: Colors.black54,
  ),
);
