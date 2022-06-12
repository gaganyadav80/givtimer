import 'package:flutter/material.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/pages/chart/widgets/line_chart.dart';
import 'package:givtimer/pages/chart/widgets/time_info_card.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({Key? key}) : super(key: key);

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chart',
            style: GoogleFonts.dmSerifDisplay(
              textStyle: Theme.of(context).textTheme.headline2,
            ),
          ),
          const VSpace(10),
          Row(
            children: [
              Expanded(
                child: TimeInfoCard(
                  time: DBHelper().getActivityTotalSeconds('givnotes') ~/ 60,
                  title: 'Total Time',
                ),
              ),
              const HSpace(10),
              Expanded(
                child: TimeInfoCard(
                  time: DBHelper().getActivityTotalSeconds('givnotes') ~/
                      (15 * 60),
                  title: 'Average Time',
                ),
              ),
            ],
          ),
          const LineChartWidget(name: 'givnotes'),
          const VSpace(10),
          const Center(child: Text('December')),
          const VSpace(10),
        ],
      ),
    );
  }
}
