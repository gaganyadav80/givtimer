import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/activity/views/widgets/clock_wave.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class ActivityClockPage extends StatefulWidget {
  const ActivityClockPage({Key? key}) : super(key: key);

  @override
  State<ActivityClockPage> createState() => _ActivityClockPageState();
}

class _ActivityClockPageState extends State<ActivityClockPage>
    with TickerProviderStateMixin {
  final CountDownController _countDownController = CountDownController();
  late AnimationController _controller;

  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _countDownController.pause();
            Navigator.pop(context);
          },
          icon: const Icon(LineIcons.times, size: 32),
        ),
      ),
      body: Stack(
        children: [
          const ClockWaveWidget(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: kDefaultHorizontalPadding,
                child: Text(
                  'Activity',
                  style: GoogleFonts.dmSerifDisplay(
                    textStyle: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
              Padding(
                padding: kDefaultHorizontalPadding,
                child: Text(
                  context.read<TimerCubit>().state.activityName,
                  style: GoogleFonts.dmSerifDisplay(
                    textStyle: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              const VSpace(60),
              NeonCircularTimer(
                width: 300,
                isReverse: true,
                isReverseAnimation: true,
                // strokeWidth: 4,
                backgroudColor: Colors.transparent,
                neonColor: const Color(0xffA1CCA5),
                innerFillGradient: LinearGradient(
                  colors: [
                    kPurpleColor,
                    kPurpleColor.withOpacity(0.9),
                  ],
                ),
                neonGradient: const LinearGradient(
                  colors: [kPurpleColor, kPurpleColor],
                ),
                textFormat: context.read<TimerCubit>().getTextFormat(),
                textStyle: GoogleFonts.dmSerifDisplay(
                  textStyle: Theme.of(context).textTheme.headline2,
                ),
                controller: _countDownController,
                duration: context.read<TimerCubit>().getDurationInSeconds(),
                neumorphicEffect: false,
                neon: 0,
                onComplete: () {
                  TimerModel().addActivity(
                    context.read<TimerCubit>().state.activityName,
                    context.read<TimerCubit>().getDurationInSeconds(),
                  );
                  _controller.reverse();
                  isPaused = true;
                  Future.delayed(
                    const Duration(milliseconds: 300),
                    () => Navigator.pop(context),
                  );
                },
              ),
              const VSpace(80),
              Padding(
                padding: kDefaultHorizontalPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: kRoundedElevatedButtonHeight,
                        child: RoundedElevatedButton(
                          onPressed: () {
                            if (isPaused) {
                              _countDownController.resume();
                              _controller.forward();
                            } else {
                              _countDownController.pause();
                              _controller.reverse();
                            }
                            isPaused = !isPaused;
                          },
                          prefix: AnimatedIcon(
                            icon: AnimatedIcons.play_pause,
                            progress: _controller,
                          ),
                          icon: Icons.class_,
                          label: 'Pause',
                        ),
                      ),
                    ),
                    const HSpace(20),
                    Expanded(
                      child: SizedBox(
                        height: kRoundedElevatedButtonHeight,
                        child: RoundedElevatedButton(
                          onPressed: () {
                            if (_countDownController.getTimeInSeconds() !=
                                context
                                    .read<TimerCubit>()
                                    .getDurationInSeconds()) {
                              _countDownController
                                ..restart()
                                ..pause();

                              _controller.reverse();
                              isPaused = true;
                            }
                          },
                          icon: Icons.restart_alt,
                          label: 'Reset',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
