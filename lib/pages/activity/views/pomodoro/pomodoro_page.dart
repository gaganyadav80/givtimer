import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/activity/views/pomodoro/pomodoro_clock_page.dart';
import 'package:givtimer/pages/activity/views/pomodoro/widgets/pomodoro_sliders.dart';
import 'package:givtimer/pages/activity/views/widgets/widgets.dart';
import 'package:givtimer/utils/utils.dart';

class SetPomodoroPage extends StatelessWidget {
  const SetPomodoroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PomodoroCubit(),
      child: const _PomodoroPageBody(),
    );
  }
}

class _PomodoroPageBody extends StatelessWidget {
  const _PomodoroPageBody({Key? key}) : super(key: key);

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
                  title: 'Pomodoro',
                  onTextChanged: (value) =>
                      context.read<PomodoroCubit>().activityName(value),
                  activityKeys: HiveHelper().userActivityKeys,
                ),
                const PomodoroSlidersWidget(),
              ],
            ),
            BottomStartButton(
              heroTag: 'set-pomodoro-button',
              onPressed: () {
                if (context.read<PomodoroCubit>().state.activityName.isEmpty) {
                  showBasicSnackBar(context, 'Activity name is empty');
                } else {
                  context.pushMaterial(
                    BlocProvider.value(
                      value: context.read<PomodoroCubit>(),
                      child: PomodoroClockPage(
                        initialFocusTime: context
                            .read<PomodoroCubit>()
                            .focusDurationInSeconds(),
                        initialSetsCount:
                            context.read<PomodoroCubit>().state.setsCount,
                      ),
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
