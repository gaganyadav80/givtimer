import 'package:flutter/material.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/pages/chart/widgets/line_chart_widget.dart';
import 'package:givtimer/pages/chart/widgets/time_info_card.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityChartPage extends StatelessWidget {
  const ActivityChartPage({
    Key? key,
    required this.activityName,
  }) : super(key: key);

  final String activityName;

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
              activityName,
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
                        DBHelper().getActivityTotalSeconds(activityName) ~/ 60,
                    title: 'Total Time',
                  ),
                ),
                const HSpace(10),
                Expanded(
                  child: TimeInfoCard(
                    time: DBHelper().getActivityTotalSeconds(activityName) ~/
                        (15 * 60),
                    title: 'Daily Average',
                  ),
                ),
              ],
            ),
            LineChartWidget(name: activityName),
            const VSpace(10),
            const Center(child: Text('December')),
            const VSpace(10),
          ],
        ),
      ),
    );
  }
}
