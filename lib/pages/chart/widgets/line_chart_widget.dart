import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';

class LineChartWidget<T extends Object> extends StatelessWidget {
  const LineChartWidget({
    Key? key,
    required this.data,
    required this.month,
    this.showDot = false,
  }) : super(key: key);

  final bool showDot;
  final List<FlSpot> data;
  final int month;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      // color: Colors.pink,
      child: LineChart(
        LineChartData(
          minX: 1,
          maxX: 31,
          minY: 0,
          maxY: 900, // 15 hours
          // backgroundColor: Colors.amber,
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
                interval: 5,
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value == 30) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(value.toInt().toString()),
                  );
                },
                reservedSize: 30,
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineTouchData: LineTouchData(
            getTouchedSpotIndicator: (_, List<int> indicators) {
              return indicators.map(
                (_) {
                  return TouchedSpotIndicatorData(
                    FlLine(
                      color: Colors.grey,
                      strokeWidth: 1,
                      dashArray: const [4, 2],
                    ),
                    FlDotData(
                      show: true,
                      getDotPainter: (_, __, ___, ____) {
                        return FlDotCirclePainter(
                          strokeWidth: 1,
                          color: kPurpleColor,
                          strokeColor: kPurpleColor,
                        );
                      },
                    ),
                  );
                },
              ).toList();
            },
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.white,
              getTooltipItems: (list) {
                return list.map(
                  (item) {
                    return LineTooltipItem(
                      '${item.x.toInt()} ${monthNames[month]}, ${item.y} min',
                      const TextStyle(
                        color: kPurpleColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    );
                  },
                ).toList();
              },
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              // isCurved: true,
              color: kPurpleColor,
              dotData: FlDotData(show: showDot),
              spots: data,
            )
          ],
        ),
      ),
    );
  }
}
