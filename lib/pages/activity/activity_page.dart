import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/activity/views/custom_activity.dart';
import 'package:givtimer/routes.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: ResponsiveVisibility(
          visible: false,
          visibleWhen: [DESKTOP.toSmallerResponsiveCondition()],
          child: const FlutterLogo().pOnly(left: 15),
        ),
        leadingWidth: 45,
        actions: [
          TextButton(
            child: Row(
              children: const [
                Icon(LineIcons.plusSquare, color: kPurpleColor),
                HSpace(8),
                Text('Add Activity'),
              ],
            ),
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const AddCustomActivityModal(),
            ),
          ).pSymmetric(v: 10, h: 15),
        ],
      ),
      body: Padding(
        padding: kDefaultHorizontalPadding,
        child: ResponsiveRowColumn(
          layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          columnMainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveRowColumnItem(
              columnOrder: 1,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      LineIcons.enviraGallery,
                      color: kPurpleColor,
                      size: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                          ? 36
                          : 48,
                    ),
                    const VSpace(20),
                    Column(
                      children: [
                        context
                            .read<AppBloc>()
                            .quote
                            .content
                            .text
                            .italic
                            .center
                            .size(18)
                            .make(),
                        const VSpace(10),
                        context
                            .read<AppBloc>()
                            .quote
                            .author
                            .text
                            .bold
                            .italic
                            .center
                            .size(14)
                            .make(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const ResponsiveRowColumnItem(
              child: ResponsiveVisibility(
                visible: false,
                visibleWhen: [Condition<bool>.largerThan(name: TABLET)],
                child: HSpace(40),
              ),
            ),
            ResponsiveRowColumnItem(
              columnOrder: 0,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HeadlineText("Let's start."),
                    const VSpace(40),
                    Hero(
                      tag: 'set-pomodoro-button',
                      child: SizedBox(
                        width: double.infinity,
                        height: kRoundedElevatedButtonHeight,
                        child: RoundedElevatedButton(
                          onPressed: () =>
                              context.pushNamed(RouterName.setPomodoroRoute),
                          icon: LineIcons.stopwatch,
                          label: 'Pomodoro',
                          // width: double.infinity,
                        ),
                      ),
                    ),
                    const VSpace(20),
                    Hero(
                      tag: 'set-timer-button',
                      child: SizedBox(
                        width: double.infinity,
                        height: kRoundedElevatedButtonHeight,
                        child: RoundedElevatedButton(
                          onPressed: () =>
                              context.pushNamed(RouterName.setTimerRoute),
                          icon: LineIcons.clock,
                          label: 'Set timer',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
