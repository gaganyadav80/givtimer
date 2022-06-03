import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:givtimer/pages/timer/views/widgets/bottom_start_button.dart';
import 'package:givtimer/pages/timer/views/widgets/top_activity_name.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class SetAlarmPage extends StatelessWidget {
  const SetAlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kDefaultHorizontalPadding,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TopHeadAndActivityNameWidget(title: 'Alarm'),
              ],
            ),
            BottomStartButton(heroTag: 'set-alarm-button', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
