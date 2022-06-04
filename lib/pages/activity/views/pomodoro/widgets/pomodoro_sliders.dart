import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

typedef SliderChangeCallback = void Function(double value);

class PomodoroConfigureWidget extends StatefulWidget {
  const PomodoroConfigureWidget({Key? key}) : super(key: key);

  @override
  State<PomodoroConfigureWidget> createState() =>
      _PomodoroConfigureWidgetState();
}

class _PomodoroConfigureWidgetState extends State<PomodoroConfigureWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<PomodoroCubit, PomodoroState>(
          buildWhen: (previous, current) =>
              previous.pomodoroDuration != current.pomodoroDuration,
          builder: (context, state) {
            return _PomodoroValueSlider(
              onChanged: (value) => context
                  .read<PomodoroCubit>()
                  .pomodoroDuration(value.floorToDouble()),
              title: 'Pomodoro duration',
              value: state.pomodoroDuration,
              maxValue: 60,
              minValue: 5,
            );
          },
        ),
        BlocBuilder<PomodoroCubit, PomodoroState>(
          buildWhen: (previous, current) =>
              previous.breakDuration != current.breakDuration,
          builder: (context, state) {
            return _PomodoroValueSlider(
              onChanged: (value) =>
                  context.read<PomodoroCubit>().breakDuration(value),
              title: 'Break duration',
              value: state.breakDuration,
              maxValue: 30,
              minValue: 5,
            );
          },
        ),
        BlocBuilder<PomodoroCubit, PomodoroState>(
          buildWhen: (previous, current) =>
              previous.longBreakDuration != current.longBreakDuration,
          builder: (context, state) {
            return _PomodoroValueSlider(
              onChanged: (value) =>
                  context.read<PomodoroCubit>().longBreakDuration(value),
              title: 'Long break duration',
              value: state.longBreakDuration,
              maxValue: 30,
              minValue: 5,
            );
          },
        ),
        BlocBuilder<PomodoroCubit, PomodoroState>(
          buildWhen: (previous, current) =>
              previous.pomodoroCount != current.pomodoroCount,
          builder: (context, state) {
            return _PomodoroValueSlider(
              onChanged: (value) => context
                  .read<PomodoroCubit>()
                  .pomodoroCount(value.ceilToDouble()),
              title: 'Pomodoro sets',
              value: state.pomodoroCount,
              maxValue: 10,
              minValue: 1,
            );
          },
        ),
      ],
    );
  }
}

class _PomodoroValueSlider extends StatelessWidget {
  const _PomodoroValueSlider({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.minValue,
    required this.maxValue,
  }) : super(key: key);

  final double value;
  final String title;
  final SliderChangeCallback onChanged;
  final double maxValue;
  final double minValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            title,
            style: GoogleFonts.dmSerifDisplay(
              textStyle: Theme.of(context).textTheme.headline6,
            ),
          ),
          trailing: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: kBorderRadius,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${value.ceil()} min',
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CupertinoSlider(
                value: value,
                onChanged: onChanged,
                activeColor: kPurpleColor,
                max: maxValue,
                min: minValue,
                divisions: (maxValue ~/ minValue) - 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}