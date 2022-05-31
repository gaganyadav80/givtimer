import 'package:flutter/material.dart';

class HSpace extends StatelessWidget {
  const HSpace(this.width, {Key? key}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

class VSpace extends StatelessWidget {
  const VSpace(this.height, {Key? key}) : super(key: key);

  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

void showBasicSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}
