import 'package:flutter/material.dart';

final BorderRadius kBorderRadius = BorderRadius.circular(kDefaultRadius);
final BorderRadius kModalBorderRadius =
    BorderRadius.circular(kDefaultModalRadius);

const double kDefaultRadius = 8;
const double kDefaultModalRadius = 24;

const EdgeInsets kDefaultHorizontalPadding =
    EdgeInsets.symmetric(horizontal: 20);
const EdgeInsets kDefaultModalPadding = EdgeInsets.symmetric(horizontal: 12);

const double kRoundedElevatedButtonHeight = 60;
const double kRoundedElevatedButtonWidth = 210;

final OutlineInputBorder kInputBorderStyle = OutlineInputBorder(
  borderRadius: kBorderRadius,
  borderSide: const BorderSide(
    // color: Colors.grey[400]!,
    color: Colors.black54,
  ),
);
