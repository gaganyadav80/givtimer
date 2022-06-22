import 'package:flutter/cupertino.dart';
import 'package:givtimer/utils/utils.dart';

class BuildModalChild extends StatelessWidget {
  const BuildModalChild({Key? key, required this.child, this.height})
      : super(key: key);

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: kDefaultModalPadding,
        child: Container(
          height: height,
          // The Bottom margin is provided to align the popup above
          // the system navigation bar.
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: BoxDecoration(
            borderRadius: kModalBorderRadius,
            // Provide a background color for the popup.
            color: CupertinoColors.systemBackground.resolveFrom(context),
          ),
          // Use a SafeArea widget to avoid system overlaps.
          child: child,
        ),
      ),
    );
  }
}
