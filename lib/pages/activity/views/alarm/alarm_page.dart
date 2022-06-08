import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/activity/views/alarm/widgets/alarm_history.dart';
import 'package:givtimer/pages/activity/views/alarm/widgets/select_ringtone_modal.dart';
import 'package:givtimer/pages/activity/views/widgets/widgets.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

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
  // final ValueNotifier<TimeOfDay?> _time = ValueNotifier(TimeOfDay.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // TODO(gagan): show history of alarms
          // add each alarm details to history after alarm is set
          IconButton(
            icon: const Icon(LineIcons.history),
            iconSize: 30,
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              shape: RoundedRectangleBorder(borderRadius: kModalBorderRadius),
              constraints: BoxConstraints(maxWidth: context.screenWidth - 24),
              builder: (_) => BlocProvider.value(
                value: context.read<AlarmCubit>(),
                child: const AlarmHistory(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(LineIcons.music),
            iconSize: 30,
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              shape: RoundedRectangleBorder(borderRadius: kModalBorderRadius),
              constraints: BoxConstraints(maxWidth: context.screenWidth - 24),
              builder: (_) => BlocProvider.value(
                value: context.read<AlarmCubit>(),
                child: const SelectRingtoneModal(),
              ),
            ),
          ),
          const HSpace(10),
        ],
      ),
      body: Padding(
        padding: kDefaultHorizontalPadding,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopHeadAndActivityNameWidget(
                  title: 'Alarm',
                  onTextChanged: (value) =>
                      context.read<AlarmCubit>().setActivityName(value),
                ),
                const VSpace(20),
                BlueButton(
                  title: 'Select time',
                  onPressed: () {
                    var _time = context.read<AlarmCubit>().state.time;
                    showTimePicker(
                      context: context,
                      initialTime: _time ?? TimeOfDay.now(),
                      helpText: 'Help',
                    ).then((value) {
                      _time = value ?? _time;
                      if (_time == null) return;
                      context.read<AlarmCubit>().setTime(_time!);
                    });
                  },
                ),
                const VSpace(20),
                BlocBuilder<AlarmCubit, AlarmState>(
                  buildWhen: (previous, current) =>
                      previous.time != current.time,
                  builder: (context, state) {
                    return Text(
                      state.time?.format(context) ?? '',
                      style: GoogleFonts.dmSerifDisplay(
                        textStyle: Theme.of(context).textTheme.headline2,
                      ),
                    );
                  },
                ),
                const Divider(thickness: 1),
                BlocBuilder<AlarmCubit, AlarmState>(
                  buildWhen: (previous, current) =>
                      previous.helperText != current.helperText,
                  builder: (context, state) {
                    return ListTile(
                      title: Text(
                        state.helperText,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSerifDisplay(
                          textStyle: Theme.of(context).textTheme.headline5,
                          color: Theme.of(context).textTheme.headline2!.color,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
            BottomStartButton(
              heroTag: 'set-alarm-button',
              onPressed: () {},
              title: 'Save',
              icon: LineIcons.save,
            ),
          ],
        ),
      ),
    );
  }
}
