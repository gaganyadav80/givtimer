import 'package:flutter/material.dart';
import 'package:givtimer/theme.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider({Key? key, this.isReverse = false}) : super(key: key);

  final bool isReverse;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: isReverse ? Alignment.centerRight : Alignment.centerLeft,
            end: isReverse ? Alignment.centerLeft : Alignment.centerRight,
            colors: const [kPurpleColor, Colors.white],
          ),
        ),
      ),
    );
  }
}
