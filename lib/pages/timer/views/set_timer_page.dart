import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/timer/views/widgets/bottom_start_button.dart';
import 'package:givtimer/pages/timer/views/widgets/timer_select_time.dart';
import 'package:givtimer/pages/timer/views/widgets/top_activity_name.dart';
import 'package:givtimer/routes.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

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
      builder: (BuildContext context) => _BuildDailog(child),
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
                ),
                const SelectTimeWidget(),
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
                if (context.read<TimerCubit>().state.activityName.isEmpty) {
                  showBasicSnackBar(context, 'Please enter activity name');
                } else if (!context.read<TimerCubit>().isTimerSet()) {
                  showBasicSnackBar(context, 'Please select duration');
                } else {
                  context.pushNamed(
                    RouterName.startTimerClockRoute,
                    extra: context.read<TimerCubit>(),
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

class _BuildDailog extends StatelessWidget {
  const _BuildDailog(this.child, {Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 280,
        // The Bottom margin is provided to align the popup above
        // the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          // Provide a background color for the popup.
          color: CupertinoColors.systemBackground.resolveFrom(context),
        ),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
