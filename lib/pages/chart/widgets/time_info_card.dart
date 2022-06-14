import 'package:flutter/material.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';

class TimeInfoCard extends StatelessWidget {
  const TimeInfoCard({
    Key? key,
    required this.time,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final int time;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const SuperEllipse(radius: 8),
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      elevation: 4,
      child: InkWell(
        onTap: onTap,
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
      ),
    );
  }
}
