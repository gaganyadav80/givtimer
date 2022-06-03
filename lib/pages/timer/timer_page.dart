import 'package:flutter/material.dart';
import 'package:givtimer/routes.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: kDefaultHorizontalPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Let's start.",
              style: GoogleFonts.dmSerifDisplay(
                textStyle: Theme.of(context).textTheme.headline2,
              ),
            ),
            const VSpace(40),
            Hero(
              tag: 'set-timer-button',
              child: RoundedElevatedButton(
                onPressed: () => context.pushNamed(RouterName.setTimerRoute),
                icon: LineIcons.clock,
                label: 'Set timer',
              ),
            ),
            const VSpace(20),
            RoundedElevatedButton(
              onPressed: () => context.pushNamed(RouterName.setAlarmRoute),
              icon: LineIcons.bell,
              label: 'Set alarm',
            ),
          ],
        ),
      ),
    );
  }
}
