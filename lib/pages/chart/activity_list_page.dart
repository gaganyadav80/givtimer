import 'package:flutter/material.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/pages/chart/widgets/activity_chart_page.dart';
import 'package:givtimer/pages/chart/widgets/time_info_card.dart';
import 'package:givtimer/utils/utils.dart';

class ActivityListPage extends StatelessWidget {
  const ActivityListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpace(20),
          Row(
            children: [
              Expanded(
                child: TimeInfoCard(
                  time: DBHelper().userTotalSeconds ~/ 60,
                  title: 'Total Time',
                ),
              ),
            ],
          ),
          const VSpace(20),
          Expanded(
            child: ListView.separated(
              itemCount: DBHelper().userActivityTotal.length,
              separatorBuilder: (_, __) => const Divider(thickness: 1),
              itemBuilder: (_, int index) {
                final keyList = DBHelper().userActivityTotal.keys.toList()
                  ..sort((a, b) => a.compareTo(b));

                final name = keyList[index];
                final minutes =
                    DBHelper().userActivityTotal.values.toList()[index] ~/ 60;

                return ListTile(
                  title: Text(name.toUpperCase()),
                  trailing: Text('''$minutes min'''),
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
