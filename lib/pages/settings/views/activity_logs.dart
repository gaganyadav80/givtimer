import 'package:flutter/material.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class ActivityLogsPage extends StatelessWidget {
  const ActivityLogsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kDefaultHorizontalPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activity Logs',
              style: GoogleFonts.dmSerifDisplay(
                textStyle: Theme.of(context).textTheme.headline3,
              ),
            ),
            const VSpace(20),
            Expanded(
              child: FutureBuilder<List<ActivityLogs>>(
                future: IsarHelper().getAllLogs(),
                builder: (_, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.separated(
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        final item = snapshot.data![index];

                        return ListTile(
                          title: Text(item.name),
                          trailing: Text('${item.seconds} sec'),
                          subtitle: Text(item.date.toString()),
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (item.type == ActivityType.pomodoro)
                                const Icon(LineIcons.stopwatch)
                              else
                                const Icon(LineIcons.clock)
                            ],
                          ),
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                        );
                      },
                    );
                  } else {
                    return const ListTile(
                      minLeadingWidth: 0,
                      leading: Icon(
                        LineIcons.folderOpen,
                        color: kPurpleColor,
                      ),
                      title: Text('Nothing to show'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
