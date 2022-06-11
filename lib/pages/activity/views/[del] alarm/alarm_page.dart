// ignore_for_file: lines_longer_than_80_chars
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:givtimer/data/data.dart';
// import 'package:givtimer/logic/logic.dart';
// import 'package:givtimer/pages/activity/views/alarm/widgets/alarm_history.dart';
// import 'package:givtimer/pages/activity/views/alarm/widgets/select_ringtone_modal.dart';
// import 'package:givtimer/pages/activity/views/widgets/widgets.dart';
// import 'package:givtimer/theme.dart';
// import 'package:givtimer/utils/utils.dart';
// import 'package:givtimer/widgets/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:velocity_x/velocity_x.dart';

// class SetAlarmPage extends StatelessWidget {
//   const SetAlarmPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AlarmCubit(),
//       child: _AlarmPageBody(),
//     );
//   }
// }

// class _AlarmPageBody extends StatelessWidget {
//   _AlarmPageBody({Key? key}) : super(key: key);

//   final ValueNotifier<int> _selectedSegment = ValueNotifier<int>(0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: ValueListenableBuilder<int>(
//           valueListenable: _selectedSegment,
//           builder: (_, int value, __) {
//             return CupertinoSlidingSegmentedControl<int>(
//               groupValue: _selectedSegment.value,
//               children: const {
//                 0: Text('Set', style: TextStyle(color: Colors.black)),
//                 1: Text('Active', style: TextStyle(color: Colors.black)),
//               },
//               onValueChanged: (val) {
//                 if (val != null) _selectedSegment.value = val;
//               },
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(LineIcons.history),
//             iconSize: 30,
//             onPressed: () => showModalBottomSheet<void>(
//               context: context,
//               shape: RoundedRectangleBorder(borderRadius: kModalBorderRadius),
//               constraints: BoxConstraints(maxWidth: context.screenWidth - 24),
//               builder: (_) => BlocProvider.value(
//                 value: context.read<AlarmCubit>(),
//                 child: const AlarmHistory(),
//               ),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(LineIcons.music),
//             iconSize: 30,
//             onPressed: () => showModalBottomSheet<void>(
//               context: context,
//               shape: RoundedRectangleBorder(borderRadius: kModalBorderRadius),
//               constraints: BoxConstraints(maxWidth: context.screenWidth - 24),
//               builder: (_) => BlocProvider.value(
//                 value: context.read<AlarmCubit>(),
//                 child: const SelectRingtoneModal(),
//               ),
//             ),
//           ),
//           const HSpace(10),
//         ],
//       ),
//       body: Padding(
//         padding: kDefaultHorizontalPadding,
//         child: ValueListenableBuilder(
//           valueListenable: _selectedSegment,
//           builder: (_, int value, __) {
//             if (_selectedSegment.value == 1) {
//               return BlocBuilder<AlarmCubit, AlarmState>(
//                 builder: (context, state) {
//                   return ListView.builder(
//                     itemCount: state.activeAlarmList.length,
//                     shrinkWrap: true,
//                     itemBuilder: (_, int index) {
//                       final activity = state.activeAlarmList[index];
//                       return ListTile(
//                         title: Text(activity.name),
//                         subtitle: Text(activity.date.toLocal().toString()),
//                         trailing: Text(activity.time),
//                       );
//                     },
//                   );
//                 },
//               );
//             } else {
//               return Stack(
//                 children: [
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TopHeadAndActivityNameWidget(
//                         title: 'Alarm',
//                         onTextChanged: (value) =>
//                             context.read<AlarmCubit>().setActivityName(value),
//                       ),
//                       const VSpace(20),
//                       BlueButton(
//                         title: 'Select time',
//                         onPressed: () {
//                           var _time = context.read<AlarmCubit>().state.time;
//                           showTimePicker(
//                             context: context,
//                             initialTime: _time ?? TimeOfDay.now(),
//                             helpText: 'Help',
//                           ).then((value) {
//                             _time = value ?? _time;
//                             if (_time == null) return;
//                             context.read<AlarmCubit>().setTime(_time!);
//                           });
//                         },
//                       ),
//                       const VSpace(20),
//                       BlocBuilder<AlarmCubit, AlarmState>(
//                         buildWhen: (previous, current) =>
//                             previous.time != current.time,
//                         builder: (context, state) {
//                           return Text(
//                             state.time?.format(context) ?? '',
//                             style: GoogleFonts.dmSerifDisplay(
//                               textStyle: Theme.of(context).textTheme.headline2,
//                             ),
//                           );
//                         },
//                       ),
//                       const Divider(thickness: 1),
//                       BlocBuilder<AlarmCubit, AlarmState>(
//                         buildWhen: (previous, current) =>
//                             previous.helperText != current.helperText,
//                         builder: (context, state) {
//                           return ListTile(
//                             title: Text(
//                               state.helperText,
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.dmSerifDisplay(
//                                 textStyle:
//                                     Theme.of(context).textTheme.headline5,
//                                 color: Theme.of(context)
//                                     .textTheme
//                                     .headline2!
//                                     .color,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                   BottomStartButton(
//                     heroTag: 'set-alarm-button',
//                     onPressed: () {
//                       if (context
//                           .read<AlarmCubit>()
//                           .state
//                           .activityName
//                           .isEmpty) {
//                         showBasicSnackBar(
//                             context, 'Please enter an activity name');
//                       } else if (context.read<AlarmCubit>().state.time ==
//                           null) {
//                         showBasicSnackBar(context, 'Please select a time');
//                       } else {
//                         // showBasicSnackBar(context, '//:TODO');
//                         context.read<AlarmCubit>().addActiveAlarm(context);
//                       }
//                     },
//                     title: 'Save',
//                     icon: LineIcons.save,
//                   ),
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
