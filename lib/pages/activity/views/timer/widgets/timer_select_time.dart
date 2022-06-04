import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class TimerShowTimeWidget extends StatelessWidget {
  const TimerShowTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 120,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
                // border:
                //  Border.all(color: kPurpleColor.withOpacity(0.4), width: 2),
              ),
              child: Center(
                child: BlocBuilder<TimerCubit, TimerState>(
                  buildWhen: (previous, current) =>
                      previous.seconds != current.seconds,
                  builder: (context, state) {
                    return Text(
                      '${context.read<TimerCubit>().getDurationHours()} h',
                      style: GoogleFonts.dmSerifDisplay(
                        textStyle: Theme.of(context).textTheme.headline2,
                        color: Colors.grey[500],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          ':'.text.headline2(context).make().pLTRB(5, 0, 5, 10),
          Expanded(
            child: Container(
              height: 120,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
                // border:
                //  Border.all(color: kPurpleColor.withOpacity(0.4), width: 2),
              ),
              child: Center(
                child: BlocBuilder<TimerCubit, TimerState>(
                  builder: (context, state) {
                    return Text(
                      '${context.read<TimerCubit>().getDurationMinutes()} m',
                      style: GoogleFonts.dmSerifDisplay(
                        textStyle: Theme.of(context).textTheme.headline2,
                        color: Colors.grey[500],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
