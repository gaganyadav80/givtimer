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

const List<String> profileUrls = <String>[
  'https://firebasestorage.googleapis.com/v0/b/givtimer-app.appspot.com/o/avatars%2F0.png?alt=media&token=a8dbced7-9f94-4841-a001-0ac45e7da6ad',
  'https://firebasestorage.googleapis.com/v0/b/givtimer-app.appspot.com/o/avatars%2F1.png?alt=media&token=c7383960-7a06-415f-9dd4-5493d43fb732',
  'https://firebasestorage.googleapis.com/v0/b/givtimer-app.appspot.com/o/avatars%2F2.png?alt=media&token=8b9d7bc4-140a-4e1f-bf30-f70c4b091095',
  'https://firebasestorage.googleapis.com/v0/b/givtimer-app.appspot.com/o/avatars%2F3.png?alt=media&token=cf7b7c3c-4472-4017-b172-0a91ec29e7c1',
  'https://firebasestorage.googleapis.com/v0/b/givtimer-app.appspot.com/o/avatars%2F4.png?alt=media&token=cbf2ca6d-47e0-4c86-b6a4-859b7fdf7919',
  'https://firebasestorage.googleapis.com/v0/b/givtimer-app.appspot.com/o/avatars%2F5.png?alt=media&token=d3a9deda-612c-4b7c-b8c6-1ed88787be37',
  'https://firebasestorage.googleapis.com/v0/b/givtimer-app.appspot.com/o/avatars%2F6.png?alt=media&token=0c2b27f7-f9b8-4fd0-80f0-17e95c9d2ee1',
  'https://firebasestorage.googleapis.com/v0/b/givtimer-app.appspot.com/o/avatars%2F7.png?alt=media&token=8bf2e1a2-d6b0-4139-b865-a8e0b6d690e5',
  'https://firebasestorage.googleapis.com/v0/b/givtimer-app.appspot.com/o/avatars%2F8.png?alt=media&token=713176f3-6359-47ec-bdbc-ed64f4670485',
  'https://firebasestorage.googleapis.com/v0/b/givtimer-app.appspot.com/o/avatars%2F9.png?alt=media&token=e3a0c17e-68ff-4e9c-aad7-92aebcd38548',
];

const monthNames = <String>[
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];
