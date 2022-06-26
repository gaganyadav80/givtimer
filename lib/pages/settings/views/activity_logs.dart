import 'package:flutter/material.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:velocity_x/velocity_x.dart';

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
            const HeadlineText('Activity Logs'),
            const VSpace(20),
            Expanded(
              child: FutureBuilder<List<ActivityLog>>(
                future: FireDBHelper().getAllLogs(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(
                      child: CircularLoading(color: kPurpleColor),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.separated(
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        final item = snapshot.data![index];

                        final minutes = item.seconds ~/ 60;

                        return ListTile(
                          title: Text(item.key.toActivityname())
                              .text
                              .semiBold
                              .headline6(context)
                              .make(),
                          trailing: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                '$minutes'.text.black.headline4(context).make(),
                                'min'.text.make(),
                              ],
                            ),
                          ),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const VSpace(5),
                              Text('key: ${item.key}'),
                              Text('date: ${item.date.format()}'),
                            ],
                          ),
                          leading: Column(
                            children: [
                              Icon(
                                item.type == ActivityType.pomodoro
                                    ? LineIcons.stopwatch
                                    : LineIcons.clock,
                                color: kPurpleColor,
                              )
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
