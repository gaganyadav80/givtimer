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
                  time: HiveHelper().userTotalSeconds ~/ 60,
                  title: 'Total Time',
                  onTap: () {
                    if (HiveHelper().userActivityTotalTimeData.isNotEmpty) {
                      context.pushMaterial(const DailyTotalChartPage());
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
          // TODO(gagan): fix this conditional formatting
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

                  final key = keyList[index];
                  final minutes = activityMap[key]! ~/ 60;

                  return ListTile(
                    title: Text(key.toActivityname()),
                    trailing: Text('''$minutes min'''),
                    shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
                    onTap: () => context.pushMaterial(
                      ActivityChartPage(activityKey: key),
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
