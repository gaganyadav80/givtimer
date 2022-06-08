import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/activity/views/widgets/widgets.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SetAlarmPage extends StatelessWidget {
  const SetAlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlarmCubit(),
      child: const _AlarmPageBody(),
    );
  }
}

class _AlarmPageBody extends StatefulWidget {
  const _AlarmPageBody({Key? key}) : super(key: key);

  @override
  State<_AlarmPageBody> createState() => _AlarmPageBodyState();
}

class _AlarmPageBodyState extends State<_AlarmPageBody> {
  final ValueNotifier<TimeOfDay?> _time = ValueNotifier(TimeOfDay.now());

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
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopHeadAndActivityNameWidget(title: 'Alarm'),
                const VSpace(20),
                BlueButton(
                  title: 'Select time',
                  onPressed: () async {
                    _time.value = (await showTimePicker(
                          context: context,
                          initialTime: _time.value!,
                          helpText: 'Help',
                        )) ??
                        _time.value;
                  },
                ),
                const VSpace(20),
                ValueListenableBuilder(
                  valueListenable: _time,
                  builder: (_, TimeOfDay? value, __) {
                    return Text(
                      value.toString(),
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 32,
                        textStyle: Theme.of(context).textTheme.headline2,
                      ),
                    );
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: _time,
                  builder: (_, TimeOfDay? value, __) {
                    String? helper;
                    final timeNow = TimeOfDay.now();

                    // TODO(gagan): or use seconds to get DateTime then get the difference
                    if (value!.hour < timeNow.hour) {
                      final remainingMin = 60 - timeNow.minute;
                      final remainingHour = 24 - timeNow.hour - 1;

                      final hour = value.hour + remainingHour;
                      final minute = value.minute + remainingMin;

                      helper = 'After $hour hour(s) and $minute minute(s)';
                    } else if (value.hour == timeNow.hour &&
                        value.minute < timeNow.minute) {
                      const hour = 23;
                      final minute = 60 - (timeNow.minute - value.minute);
                      helper = 'After $hour hours and $minute minutes';
                    } else if (value.hour == timeNow.hour &&
                        value.minute > timeNow.minute) {
                      final minute = value.minute - timeNow.minute;

                      helper = 'After $minute minute(s)';
                    } else {
                      final remainingMin = 60 - timeNow.minute;
                      var hour = value.hour - timeNow.hour - 1;
                      var minute = value.minute + remainingMin;

                      if (minute > 60) {
                        minute = minute % 60;
                        hour++;
                      }

                      helper = 'After $hour hours and $minute minutes';
                    }

                    return Text(
                      helper,
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 32,
                        textStyle: Theme.of(context).textTheme.headline2,
                      ),
                    );
                  },
                ),
              ],
            ),
            BottomStartButton(heroTag: 'set-alarm-button', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
