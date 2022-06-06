import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/activity/views/widgets/widgets.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class PomodoroClockPage extends StatefulWidget {
  const PomodoroClockPage({
    Key? key,
    required this.initialFocusTime,
    required this.initialSetsCount,
  }) : super(key: key);

  final int initialFocusTime;
  final double initialSetsCount;

  @override
  State<PomodoroClockPage> createState() => _PomodoroClockPageState();
}

class _PomodoroClockPageState extends State<PomodoroClockPage>
    with TickerProviderStateMixin {
  final CountDownController _countDownController = CountDownController();
  late AnimationController _controller;

  bool isPaused = false;
  late final ValueNotifier<int> _seconds;

  int _focusCount = 0;
  int _breakCount = 0;
  int _totalSetCount = 0;

  @override
  void initState() {
    super.initState();

    _seconds = ValueNotifier(widget.initialFocusTime);
    _totalSetCount = widget.initialSetsCount.toInt();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
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
                  context.read<PomodoroCubit>().state.activityName,
                  style: GoogleFonts.dmSerifDisplay(
                    textStyle: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              const VSpace(60),
              NeonCircularTimer(
                controller: _countDownController,
                duration: _seconds.value,
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
                textStyle: GoogleFonts.dmSerifDisplay(
                  textStyle: Theme.of(context).textTheme.headline2,
                ),
                neumorphicEffect: false,
                neon: 0,
                onComplete: () async {
                  // if all sets are completed then return.
                  if (_totalSetCount == 0) return;

                  // if initially both count are equal which means either
                  // start or a set is completed. So start with focus timer.
                  if (_focusCount == _breakCount) {
                    // increment the focus count because at first the timer
                    // is in focus mode
                    _focusCount++;
                    PomodoroModel().addActivity(
                      context.read<PomodoroCubit>().state.activityName,
                      _seconds.value,
                    );

                    // check if needs long break or short break
                    // if focus count is even then it needs long break
                    if (_focusCount.isEven) {
                      _seconds.value = context
                          .read<PomodoroCubit>()
                          .longBreakDurationInSeconds();
                    } else {
                      _seconds.value = context
                          .read<PomodoroCubit>()
                          .breakDurationInSeconds();
                    }
                  } else {
                    _breakCount++;
                    _seconds.value =
                        context.read<PomodoroCubit>().focusDurationInSeconds();
                  }

                  // After incrementing focus or break count check if they
                  // are equal then count it as a set. We check this at the
                  // end to avoid counting 0'th set twice when the values
                  // of _focus and _break are [0] and equal. We first
                  // increment and then check if they are equal.
                  if (_focusCount == _breakCount) {
                    _totalSetCount--;
                  }

                  _countDownController
                    ..restart(duration: _seconds.value)
                    ..pause();
                  await _controller.reverse();
                  await Future.delayed(const Duration(seconds: 3), () {});
                  _countDownController.resume();
                  await _controller.forward();
                },
              ),
              const VSpace(80),
              Padding(
                padding: kDefaultHorizontalPadding,
                child: SizedBox(
                  height: kRoundedElevatedButtonHeight,
                  width: kRoundedElevatedButtonWidth,
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
            ],
          ),
        ],
      ),
    );
  }
}
