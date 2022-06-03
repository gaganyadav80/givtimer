import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/timer/views/widgets/timer_pomodoro.dart';
import 'package:givtimer/pages/timer/views/widgets/timer_select_time.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

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

class _TimerPageBody extends StatefulWidget {
  const _TimerPageBody({Key? key}) : super(key: key);

  @override
  State<_TimerPageBody> createState() => _TimerPageBodyState();
}

class _TimerPageBodyState extends State<_TimerPageBody>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select the duration',
          style: GoogleFonts.dmSerifDisplay(
            textStyle: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: kDefaultHorizontalPadding,
          //   child: Text(
          //     'Select the duration',
          //     style: GoogleFonts.dmSerifDisplay(
          //       textStyle: Theme.of(context).textTheme.headline4,
          //     ),
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Center(
              child: Icon(LineIcons.snowflake, color: kPurpleColor),
            ),
          ),
          BlocBuilder<TimerCubit, TimerState>(
            buildWhen: (previous, current) =>
                previous.usePomodoro != current.usePomodoro,
            builder: (context, state) {
              return ListTile(
                title: 'Use pomodoro timer'.text.size(20).medium.gray700.make(),
                horizontalTitleGap: 0,
                leading: const Icon(LineIcons.stopwatch),
                trailing: CupertinoSwitch(
                  value: state.usePomodoro,
                  activeColor: kPurpleColor,
                  onChanged: (value) {
                    context.read<TimerCubit>().usePomodoro(value);
                    if (value) {
                      _tabController.animateTo(1);
                    } else {
                      _tabController.animateTo(0);
                    }
                  },
                ),
              );
            },
          ),
          const Divider(indent: 20, endIndent: 20, thickness: 1),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                SelectTimeWidget(),
                TimerPomodoroWidget(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50, top: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Hero(
                tag: 'set-timer-button',
                child: RoundedElevatedButton(
                  onPressed: () {},
                  icon: LineIcons.play,
                  label: 'Start',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
