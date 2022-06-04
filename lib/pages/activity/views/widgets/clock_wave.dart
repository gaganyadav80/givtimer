import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class ClockWaveWidget extends StatelessWidget {
  const ClockWaveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [const Color(0xffA1CCA5), const Color(0xffA1CCA5).withOpacity(0.5)],
            [const Color(0xFF8FB996), const Color(0xFF8FB996).withOpacity(0.5)],
            [const Color(0xFF709775), const Color(0xFF709775).withOpacity(0.5)],
            [const Color(0xFF415D43), const Color(0xFF415D43).withOpacity(0.5)]
          ],
          durations: [35000, 19440, 10800, 6000],
          heightPercentages: [0.0, 0.1, 0.25, 0.3],
          blur: const MaskFilter.blur(BlurStyle.solid, 10),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
          // colors: [
          //   Colors.white70,
          //   Colors.white54,
          //   Colors.white30,
          //   Colors.white24,
          // ],
        ),
        size: Size.infinite,
        // waveAmplitude: 0,
        // backgroundImage: const DecorationImage(
        //   image: NetworkImage(
        //     'https://images.unsplash.com/photo-1600107363560-a2a891080c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=672&q=80',
        //   ),
        //   fit: BoxFit.cover,
        //   colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
        // ),
      ),
    );
  }
}
