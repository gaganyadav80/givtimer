import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/pages/chart/widgets/line_chart_widget.dart';
import 'package:givtimer/pages/chart/widgets/time_info_card.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:line_icons/line_icons.dart';

class ActivityChartPage extends StatefulWidget {
  const ActivityChartPage({
    Key? key,
    required this.activityKey,
  }) : super(key: key);

  final String activityKey;

  @override
  State<ActivityChartPage> createState() => _ActivityChartPageState();
}

class _ActivityChartPageState extends State<ActivityChartPage> {
  final ValueNotifier<int> _year = ValueNotifier<int>(DateTime.now().year);
  final ValueNotifier<int> _month = ValueNotifier<int>(DateTime.now().month);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kDefaultHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadlineText(widget.activityKey),
            const VSpace(10),
            Row(
              children: [
                // Expanded(
                //   child: TimeInfoCard(
                //     time: FireDBHelper()
                //             .getActivityTotalSeconds(widget.activityKey) ~/
                //         60,
                //     title: 'Total Time',
                //   ),
                // ),
                // const HSpace(10),
                Expanded(
                  child: TimeInfoCard(
                    time: FireDBHelper()
                            .getActivityTotalSeconds(widget.activityKey) ~/
                        (15 * 60),
                    title: 'Daily Average',
                  ),
                ),
              ],
            ),
            const VSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(LineIcons.angleLeft),
                      onPressed: () {
                        _year.value = _year.value - 1;
                      },
                    ),
                    ValueListenableBuilder<int>(
                      valueListenable: _year,
                      builder: (_, int value, __) {
                        return Text(value.toString());
                      },
                    ),
                    IconButton(
                      icon: const Icon(LineIcons.angleRight),
                      onPressed: () {
                        _year.value = _year.value + 1;
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(LineIcons.angleLeft),
                      onPressed: () {
                        var temp = _month.value - 1;
                        if (temp == 0) {
                          temp = 12;
                          _year.value = _year.value - 1;
                        }
                        _month.value = temp;
                      },
                    ),
                    SizedBox(
                      width: 80,
                      child: Center(
                        child: ValueListenableBuilder<int>(
                          valueListenable: _month,
                          builder: (_, int value, __) {
                            return Text(monthNames[value - 1]);
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(LineIcons.angleRight),
                      onPressed: () {
                        var temp = _month.value + 1;
                        if (temp == 13) {
                          temp = 1;
                          _year.value = _year.value + 1;
                        }
                        _month.value = temp;
                      },
                    ),
                  ],
                ),
              ],
            ),
            const VSpace(30),
            ValueListenableBuilder<int>(
              valueListenable: _year,
              builder: (_, int year, __) {
                return ValueListenableBuilder<int>(
                  valueListenable: _month,
                  builder: (_, int month, __) {
                    return FutureBuilder<List<DailyActivityData>>(
                      future: FireDBHelper()
                          .getAllActivityByKey(widget.activityKey),
                      initialData: const [],
                      builder: (_, snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          final data = snapshot.data!
                              .where(
                                (element) =>
                                    element.date.year == year &&
                                    element.date.month == month,
                              )
                              .toList();

                          final showDot = data.length < 2;
                          data.sort((a, b) => a.date.day.compareTo(b.date.day));

                          return LineChartWidget(
                            showDot: showDot,
                            month: _month.value - 1,
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
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
