import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/pages/chart/widgets/line_chart_widget.dart';
import 'package:givtimer/pages/chart/widgets/time_info_card.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityChartPage extends StatelessWidget {
  const ActivityChartPage({
    Key? key,
    required this.activityKey,
  }) : super(key: key);

  final String activityKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kDefaultHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activityKey,
              style: GoogleFonts.dmSerifDisplay(
                textStyle: Theme.of(context).textTheme.headline2,
              ),
            ),
            const VSpace(10),
            Row(
              children: [
                Expanded(
                  child: TimeInfoCard(
                    time:
                        HiveHelper().getActivityTotalSeconds(activityKey) ~/ 60,
                    title: 'Total Time',
                  ),
                ),
                const HSpace(10),
                Expanded(
                  child: TimeInfoCard(
                    time: HiveHelper().getActivityTotalSeconds(activityKey) ~/
                        (15 * 60),
                    title: 'Daily Average',
                  ),
                ),
              ],
            ),
            FutureBuilder<List<DailyActivityData>>(
              future: IsarHelper().getActivityByKey(activityKey),
              initialData: const [],
              builder: (_, AsyncSnapshot<List<DailyActivityData>> snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  // data = data!.where((element) =>
                  //     element.date.year == 2021 && element.date.month == 12)
                  //     .toList();

                  // for (var i = 1; i < 31; i++) {
                  //   if (i == 19 || i == 11) continue;

                  //   data.add(
                  //     DailyActivityData()
                  //       ..date = DateTime(2021, 12, i)
                  //       ..name = 'read'
                  //       ..seconds = Random().nextInt(9001) + 1800
                  //       ..type = ActivityType.timer,
                  //   );
                  // }

                  // data.sort((a, b) => a.date.day.compareTo(b.date.day));
                  // data = data.sublist(0, 16);

                  final data = snapshot.data;
                  final showDot = data!.length < 2;

                  return LineChartWidget(
                    showDot: showDot,
                    data: List<FlSpot>.generate(
                      data.length,
                      (index) => FlSpot(
                        data[index].date.day.toDouble(),
                        (data[index].seconds ~/ 60).roundToDouble(),
                      ),
                    ),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return const EmptyListIndicatorTile();
                } else {
                  return const Expanded(
                    child: Center(child: CircularLoading()),
                  );
                }
              },
            ),
            const VSpace(10),
            const Center(child: Text('December')),
            const VSpace(10),
          ],
        ),
      ),
    );
  }
}
