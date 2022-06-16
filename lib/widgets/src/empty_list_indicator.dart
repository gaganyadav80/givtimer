import 'package:flutter/material.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:line_icons/line_icons.dart';

class EmptyListIndicatorTile extends StatelessWidget {
  const EmptyListIndicatorTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListTile(
        minLeadingWidth: 0,
        leading: Icon(
          LineIcons.folderOpen,
          color: kPurpleColor,
        ),
        title: Text('Nothing to show'),
      ),
    );
  }
}

class EmptyListIndicatorRow extends StatelessWidget {
  const EmptyListIndicatorRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            LineIcons.folderOpen,
            color: kPurpleColor,
          ),
          HSpace(10),
          Text('Nothing to show')
        ],
      ),
    );
  }
}
