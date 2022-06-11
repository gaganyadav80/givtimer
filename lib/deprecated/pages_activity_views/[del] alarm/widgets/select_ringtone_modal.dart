// ignore_for_file: lines_longer_than_80_chars
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:givtimer/logic/logic.dart';
// import 'package:givtimer/theme.dart';
// import 'package:givtimer/utils/utils.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:line_icons/line_icons.dart';

// class SelectRingtoneModal extends StatelessWidget {
//   const SelectRingtoneModal({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: 280,
//       // The Bottom margin is provided to align the popup above
//       // the system navigation bar.
//       margin: EdgeInsets.only(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//       ),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(borderRadius: kModalBorderRadius),
//       // Use a SafeArea widget to avoid system overlaps.
//       child: SafeArea(
//         top: false,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               title: Text(
//                 'Select Ringtone',
//                 style: GoogleFonts.dmSerifDisplay(
//                   textStyle: Theme.of(context).textTheme.headline4,
//                 ),
//               ),
//             ),
//             const VSpace(10),
//             ListView.separated(
//               physics: const NeverScrollableScrollPhysics(),
//               separatorBuilder: (_, __) => const Divider(),
//               itemCount: 4,
//               shrinkWrap: true,
//               itemBuilder: (_, index) => BlocBuilder<AlarmCubit, AlarmState>(
//                 builder: (context, state) {
//                   final isSelected = state.selectedRingtoneIdx == index;

//                   return ListTile(
//                     leading: Icon(
//                       LineIcons.music,
//                       color: isSelected ? kPurpleColor : null,
//                     ),
//                     shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
//                     title: Text(
//                       'Ringtone ${index + 1}',
//                       style: GoogleFonts.roboto(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     trailing: isSelected
//                         ? const Icon(
//                             LineIcons.check,
//                             color: kPurpleColor,
//                           )
//                         : null,
//                     onTap: () => context
//                         .read<AlarmCubit>()
//                         .setSelectedRingtoneIdx(index),
//                   );
//                 },
//               ),
//             ),
//             const VSpace(20),
//           ],
//         ),
//       ),
//     );
//   }
// }
