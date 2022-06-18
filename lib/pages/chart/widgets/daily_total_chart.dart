import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/chart/widgets/line_chart_widget.dart';
import 'package:givtimer/pages/chart/widgets/time_info_card.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyTotalChartPage extends StatelessWidget {
  const DailyTotalChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Total days will be counted from the time user created an account
    final totalDays = DateTime.now()
        .difference(context.read<AppBloc>().state.user.createdAt!)
        .inDays;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kDefaultHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overall',
              style: GoogleFonts.dmSerifDisplay(
                textStyle: Theme.of(context).textTheme.headline2,
              ),
            ),
            const VSpace(10),
            Row(
              children: [
                Expanded(
                  child: TimeInfoCard(
                    time: HiveHelper().userTotalSeconds ~/ 60,
                    title: 'Total Time',
                  ),
                ),
                const HSpace(10),
                Expanded(
                  child: TimeInfoCard(
                    time: HiveHelper().userTotalSeconds ~/ (60 * totalDays),
                    title: 'Daily Average',
                  ),
                ),
              ],
            ),
            FutureBuilder<List<DailyProductiveTime>>(
              future: IsarHelper().getAllDailyTotal(),
              initialData: const [],
              builder: (_, AsyncSnapshot<List<DailyProductiveTime>> snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
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
            if (HiveHelper().userTotalSeconds >= 60)
              const Center(child: Text('December')),
            const VSpace(40),
          ],
        ),
      ),
    );
  }
}
