import 'package:flutter/material.dart';
import 'package:givtimer/pages/activity/views/widgets/widgets.dart';
import 'package:givtimer/utils/utils.dart';

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
