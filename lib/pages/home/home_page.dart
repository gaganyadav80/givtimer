import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/data/db_helper.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/pages.dart';
import 'package:line_icons/line_icons.dart';

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
    if (DBHelper().userId == null) DBHelper().initUserData(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (_, state) {
            return [
              const ActivityPage(),
              const Center(child: Text('Chart [Paid]')),
              const SettingsPage(),
            ][state.homeIdx];
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.homeIdx,
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
    );
  }
}
