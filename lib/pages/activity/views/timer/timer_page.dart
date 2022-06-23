import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/activity/views/timer/timer_clock_page.dart';
import 'package:givtimer/pages/activity/views/timer/widgets/timer_select_time.dart';
import 'package:givtimer/pages/activity/views/widgets/widgets.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';

class SetTimerPage extends StatelessWidget {
  const SetTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(),
      child: const _TimerPageBody(),
    );
  }
}

class _TimerPageBody extends StatelessWidget {
  const _TimerPageBody({Key? key}) : super(key: key);

  void _showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => BuildModalChild(
        height: 280,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kDefaultHorizontalPadding,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopHeadAndActivityNameWidget(
                  title: 'Timer',
                  onTextChanged: (String value) =>
                      context.read<TimerCubit>().setActivityName(value),
                  activityKeys: FireDBHelper().userActivityKeys,
                ),
                const TimerShowTimeWidget(),
                const VSpace(40),
                BlueButton(
                  title: 'Select time',
                  onPressed: () => _showDialog(
                    CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.hm,
                      initialTimerDuration:
                          context.read<TimerCubit>().state.duration,
                      minuteInterval: 5,
                      onTimerDurationChanged: (Duration newDuration) {
                        context.read<TimerCubit>().setDuration(newDuration);
                      },
                    ),
                    context,
                  ),
                ),
              ],
            ),
            BottomStartButton(
              heroTag: 'set-timer-button',
              onPressed: () {
                context
                    .read<TimerCubit>()
                    .setDuration(const Duration(seconds: 60));

                if (context.read<TimerCubit>().state.activityName.isEmpty) {
                  showBasicSnackBar(context, 'Please enter activity name');
                } else if (!context.read<TimerCubit>().isTimerSet()) {
                  showBasicSnackBar(context, 'Please select duration');
                } else {
                  context.pushMaterial(
                    BlocProvider.value(
                      value: context.read<TimerCubit>(),
                      child: const ActivityClockPage(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
