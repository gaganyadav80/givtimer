import 'package:flutter/material.dart';
import 'package:givtimer/utils/utils.dart';

class TimeInfoCard extends StatelessWidget {
  const TimeInfoCard({
    Key? key,
    required this.time,
    required this.title,
  }) : super(key: key);

  final int time;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            const VSpace(20),
            Text(
              '$time min',
            ),
          ],
        ),
      ),
    );
  }
}
