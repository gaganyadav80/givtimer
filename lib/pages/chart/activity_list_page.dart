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
                  time: FireDBHelper().userTotalSeconds ~/ 60,
                  title: 'Total Time',
                  onTap: () {
                    if (FireDBHelper().userTotalSeconds > 60) {
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
          Expanded(
            child: FutureBuilder<Map<String, int>>(
              future: FireDBHelper().userActivityTotalTimeData,
              initialData: const <String, int>{},
              builder: (_, snapshot) {
                final activityMap = snapshot.data;

                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularLoading());
                } else if (activityMap != null && activityMap.isNotEmpty) {
                  return ListView.separated(
                    itemCount: activityMap.length,
                    separatorBuilder: (_, __) => const Divider(thickness: 1),
                    itemBuilder: (_, int index) {
                      final keyList = activityMap.keys.toList()
                        ..sort((a, b) => a.compareTo(b));

                      final key = keyList[index];
                      final minutes = activityMap[key]! ~/ 60;

                      return ListTile(
                        title: Text(key.toActivityname()),
                        trailing: Text('''$minutes min'''),
                        shape:
                            RoundedRectangleBorder(borderRadius: kBorderRadius),
                        onTap: () => context.pushMaterial(
                          ActivityChartPage(activityKey: key),
                        ),
                      );
                    },
                  );
                } else {
                  return const EmptyListIndicatorRow();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
