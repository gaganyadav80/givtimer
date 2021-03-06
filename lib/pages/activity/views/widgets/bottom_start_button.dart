import 'package:flutter/material.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';

class BottomStartButton extends StatelessWidget {
  const BottomStartButton({
    Key? key,
    required this.heroTag,
    required this.onPressed,
    this.title = 'Start',
    this.icon = LineIcons.play,
  }) : super(key: key);

  final String heroTag;
  final VoidCallback onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50, top: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Hero(
          tag: heroTag,
          child: SizedBox(
            height: kRoundedElevatedButtonHeight,
            width: kRoundedElevatedButtonWidth,
            child: RoundedElevatedButton(
              onPressed: onPressed,
              icon: icon,
              label: title,
            ),
          ),
        ),
      ),
    );
  }
}
