import 'package:flutter/material.dart';
import 'package:givtimer/routes.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  // final List<String> activityName = const [
  //   'read',
  //   'dsa',
  //   'givtimer',
  //   'givnotes',
  //   'netflix',
  //   'walking',
  //   'running',
  //   'cycling',
  //   'swimming',
  //   'hiking',
  //   'biking',
  //   'skiing',
  //   'snowboarding',
  //   'study',
  //   'homework',
  //   'intern',
  //   'parttime',
  //   'gym'
  // ];

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
            Hero(
              tag: 'set-timer-button',
              child: SizedBox(
                width: double.infinity,
                height: kRoundedElevatedButtonHeight,
                child: RoundedElevatedButton(
                  onPressed: () => context.pushNamed(RouterName.setTimerRoute),
                  icon: LineIcons.clock,
                  label: 'Set timer',
                ),
              ),
            ),
            // const VSpace(20),
            // SizedBox(
            //   width: double.infinity,
            //   height: kRoundedElevatedButtonHeight,
            //   child: RoundedElevatedButton(
            //     onPressed: () async {
            //       for (var i = 0; i < 200; i++) {
            //         final typeIdx = Random().nextBool();
            //         final type =
            //             typeIdx ? ActivityType.pomodoro : ActivityType.timer;
            //         final name = activityName[Random().nextInt(18)];
            //         final seconds = Random().nextInt(9001) + 1800;
            //         final date = RandomDate.withRange(2021, 2021).random();
            //         await IsarHelper()
            //             .createActivity(type, name, seconds, date);
            //       }
            //       print('DONE');
            //     },
            //     icon: LineIcons.exclamationTriangle,
            //     label: 'Set Random Logs',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
