import 'package:flutter/material.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/pages/chart/widgets/activity_chart_page.dart';
import 'package:givtimer/pages/chart/widgets/daily_total_chart.dart';
import 'package:givtimer/pages/chart/widgets/time_info_card.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';

class ActivityListPage extends StatelessWidget {
  const ActivityListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpace(10),
          Row(
            children: [
              Expanded(
                child: TimeInfoCard(
                  time: HiveHelper().userTotalSeconds,
                  title: 'Total Time',
                  onTap: () {
                    if (HiveHelper().userActivityTotalTimeData.isNotEmpty) {
                      // TODO(gagan): try using same page as activity chart
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DailyTotalChartPage(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          const VSpace(10),
          Row(
            children: const [
              GradientDivider(),
              Icon(LineIcons.gem, color: kPurpleColor),
              GradientDivider(isReverse: true),
            ],
          ),
          const VSpace(10),
          if (HiveHelper().userActivityTotalTimeData.isEmpty)
            const Expanded(
              child: EmptyListIndicatorRow(),
            ),
          if (HiveHelper().userActivityTotalTimeData.isNotEmpty)
            Expanded(
              child: ListView.separated(
                itemCount: HiveHelper().userActivityTotalTimeData.length,
                separatorBuilder: (_, __) => const Divider(thickness: 1),
                itemBuilder: (_, int index) {
                  final activityMap = HiveHelper().userActivityTotalTimeData;
                  final keyList = activityMap.keys.toList()
                    ..sort((a, b) => a.compareTo(b));

                  final name = keyList[index];
                  final minutes = activityMap[name]!;

                  return ListTile(
                    title: Text(name.toUpperCase()),
                    trailing: Text('''$minutes sec'''),
                    shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
                    onTap: () => Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ActivityChartPage(activityName: name),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
