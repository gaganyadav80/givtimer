import 'package:flutter/material.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class AlarmHistory extends StatelessWidget {
  const AlarmHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 280,
      // The Bottom margin is provided to align the popup above
      // the system navigation bar.
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: kModalBorderRadius),
      // Use a SafeArea widget to avoid system overlaps.
      child: SafeArea(
        top: false,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'History',
                style: GoogleFonts.dmSerifDisplay(
                  textStyle: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            const VSpace(10),
            if (AlarmModel().alarmActivity.isEmpty)
              const Expanded(
                child: Center(
                  child: ListTile(
                    minLeadingWidth: 0,
                    leading: Icon(
                      LineIcons.folderOpen,
                      color: kPurpleColor,
                    ),
                    title: Text('Nothing to show'),
                  ),
                ),
              ),
            if (AlarmModel().alarmActivity.isNotEmpty)
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final item = AlarmModel().alarmActivity[index];
                  return ListTile(
                    title: Text(item.name),
                    trailing: Text(item.seconds.toString()),
                  );
                },
              ),
            const VSpace(20),
          ],
        ),
      ),
    );
  }
}
