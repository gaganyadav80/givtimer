import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/chart/activity_list_page.dart';
import 'package:givtimer/pages/pages.dart';
import 'package:givtimer/theme.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void updateIdx(int idx) => emit(idx);
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: _HomePageBody(
        userId: context.read<AppBloc>().state.user.id,
      ),
    );
  }
}

class _HomePageBody extends StatefulWidget {
  const _HomePageBody({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  State<_HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<_HomePageBody> {
  @override
  void initState() {
    if (FireDBHelper().userId == null) FireDBHelper().init(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveRowColumn(
          layout: ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              child: ResponsiveVisibility(
                visible: false,
                visibleWhen: const [Condition<bool>.largerThan(name: TABLET)],
                child: BlocBuilder<HomeCubit, int>(
                  builder: (_, state) {
                    return NavigationRail(
                      selectedIndex: state,
                      onDestinationSelected: (idx) =>
                          context.read<HomeCubit>().updateIdx(idx),
                      elevation: 6,
                      selectedLabelTextStyle:
                          const TextStyle(color: kPurpleColor, fontSize: 12),
                      unselectedLabelTextStyle:
                          const TextStyle(color: Colors.grey, fontSize: 12),
                      labelType: NavigationRailLabelType.all,
                      groupAlignment: 0,
                      destinations: const [
                        NavigationRailDestination(
                          icon: Icon(LineIcons.home),
                          label: Text('Home'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(LineIcons.lineChart),
                          label: Text('Chart'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(LineIcons.cog),
                          label: Text('Settings'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            ResponsiveRowColumnItem(
              child: Expanded(
                child: BlocBuilder<HomeCubit, int>(
                  builder: (_, state) {
                    return [
                      const ActivityPage(),
                      const ActivityListPage(),
                      const SettingsPage(),
                    ][state];
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ResponsiveVisibility(
        visible: false,
        visibleWhen: const [Condition<bool>.smallerThan(name: DESKTOP)],
        child: BlocBuilder<HomeCubit, int>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state,
              onTap: (value) => context.read<HomeCubit>().updateIdx(value),
              selectedFontSize: 12,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.home),
                  label: 'Home',
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.lineChart),
                  label: 'Chart',
                  tooltip: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.cog),
                  label: 'Settings',
                  tooltip: '',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
