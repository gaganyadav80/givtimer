import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/pages.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const _HomePageBody(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return [
              const TimerPage(),
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
