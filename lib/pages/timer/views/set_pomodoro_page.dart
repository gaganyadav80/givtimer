import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/timer/views/widgets/bottom_start_button.dart';
import 'package:givtimer/pages/timer/views/widgets/timer_pomodoro.dart';
import 'package:givtimer/pages/timer/views/widgets/top_activity_name.dart';
import 'package:givtimer/routes.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

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
              children: const [
                TopHeadAndActivityNameWidget(title: 'Pomodoro'),
                TimerPomodoroWidget(),
              ],
            ),
            BottomStartButton(heroTag: 'set-pomodoro-button', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
