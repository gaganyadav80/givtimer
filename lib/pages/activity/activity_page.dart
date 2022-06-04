import 'package:flutter/material.dart';
import 'package:givtimer/routes.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

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
              tag: 'set-pomodoro-button',
              child: SizedBox(
                width: double.infinity,
                height: kRoundedElevatedButtonHeight,
                child: RoundedElevatedButton(
                  onPressed: () =>
                      context.pushNamed(RouterName.setPomodoroRoute),
                  icon: LineIcons.stopwatch,
                  label: 'Pomodoro',
                  // width: double.infinity,
                ),
              ),
            ),
            const VSpace(20),
            Row(
              children: [
                Expanded(
                  child: Hero(
                    tag: 'set-timer-button',
                    child: SizedBox(
                      height: kRoundedElevatedButtonHeight,
                      child: RoundedElevatedButton(
                        onPressed: () =>
                            context.pushNamed(RouterName.setTimerRoute),
                        icon: LineIcons.clock,
                        label: 'Set timer',
                      ),
                    ),
                  ),
                ),
                const HSpace(10),
                Expanded(
                  child: Hero(
                    tag: 'set-alarm-button',
                    child: SizedBox(
                      height: kRoundedElevatedButtonHeight,
                      child: RoundedElevatedButton(
                        onPressed: () =>
                            context.pushNamed(RouterName.setAlarmRoute),
                        icon: LineIcons.bell,
                        label: 'Set alarm',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
