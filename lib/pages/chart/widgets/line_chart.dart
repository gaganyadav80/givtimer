import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/widgets/widgets.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ActivityData>>(
      future: IsarHelper().getActivityByName(name),
      initialData: const [],
      builder: (_, AsyncSnapshot<List<ActivityData>> snapshot) {
        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
          var data = snapshot.data;
          data = data!
              .where(
                (element) =>
                    element.date.year == 2021 && element.date.month == 12,
              )
              .toList();

          for (var i = 1; i < 31; i++) {
            if (i == 19 || i == 11) continue;

            data.add(
              ActivityData()
                ..date = DateTime(2021, 12, i)
                ..name = 'givnotes'
                ..seconds = Random().nextInt(9001) + 1800
                ..type = ActivityType.timer,
            );
          }

          data.sort((a, b) => a.date.day.compareTo(b.date.day));
          data = data.sublist(0, 16);

          return SizedBox(
            height: 300,
            child: LineChart(
              LineChartData(
                minX: 1,
                maxX: 15,
                minY: 0,
                maxY: 200,
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      interval: 1,
                      showTitles: true,
                      reservedSize: 30,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    // isCurved: true,
                    dotData: FlDotData(show: false),
                    spots: List.generate(
                      15,
                      (index) => FlSpot(
                        index + 1,
                        (data![index].seconds / 60).roundToDouble(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularLoading());
        }
      },
    );
  }
}
