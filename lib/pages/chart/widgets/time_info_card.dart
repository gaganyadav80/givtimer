import 'package:flutter/material.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

class TimeInfoCard extends StatelessWidget {
  const TimeInfoCard({
    Key? key,
    required this.time,
    required this.title,
    this.onTap,
    this.icon,
    this.backgroundColor,
  }) : super(key: key);

  final int time;
  final String title;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? backgroundColor;

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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor ?? kPurpleColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon ?? LineIcons.hourglassEnd,
                      color: Colors.white,
                    ).p(8),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      '$time'.text.bold.black.headline4(context).make(),
                      'min'.text.make(),
                    ],
                  ),
                ],
              ),
              const VSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title.text.bold.gray700.size(20).make(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
