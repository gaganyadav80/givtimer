import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/timer/views/widgets/start_clock_wave.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

class StartClockPage extends StatelessWidget {
  const StartClockPage({Key? key, required this.timerCubit}) : super(key: key);

  final TimerCubit timerCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: timerCubit,
      child: _StartClockBody(
        seconds: timerCubit.getDurationInSeconds(),
        textFormat: timerCubit.getTimerTextFormat(),
      ),
    );
  }
}

class _StartClockBody extends StatefulWidget {
  const _StartClockBody({
    Key? key,
    required this.seconds,
    required this.textFormat,
  }) : super(key: key);

  final int seconds;
  final TextFormat textFormat;

  @override
  State<_StartClockBody> createState() => _StartClockBodyState();
}

class _StartClockBodyState extends State<_StartClockBody> {
  final CountDownController _countDownController = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _countDownController.pause();
            context.pop();
          },
          icon: const Icon(LineIcons.times, size: 32),
        ),
      ),
      body: Stack(
        children: [
          const StartClockWaveWidget(),
          Column(
            children: [
              const VSpace(20),
              NeonCircularTimer(
                width: 300,
                isReverse: true,
                backgroudColor: Colors.transparent,
                neonColor: const Color(0xffA1CCA5),
                innerFillGradient: LinearGradient(
                  colors: [
                    kPurpleColor,
                    kPurpleColor.withOpacity(0.5),
                  ],
                ),
                neonGradient: LinearGradient(
                  colors: [
                    // Colors.greenAccent.shade200,
                    // Colors.blueAccent.shade400
                    kPurpleColor,
                    kPurpleColor.withOpacity(0.5),
                  ],
                ),
                textFormat: widget.textFormat,
                textStyle: GoogleFonts.dmSerifDisplay(
                  textStyle: Theme.of(context).textTheme.headline2,
                ),
                controller: _countDownController,
                duration: widget.seconds,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
