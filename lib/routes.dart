import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/pages.dart';
import 'package:go_router/go_router.dart';

abstract class RouterName {
  static const String root = '/';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  // static const String verificationRoute = '/verification';
  static const String profileRoute = '/profile';
  static const String setPomodoroRoute = '/pomodoro';
  static const String setTimerRoute = '/setTimer';
  static const String setAlarmRoute = '/setAlarm';
  static const String startTimerClockRoute = '/startTimerClock';
}

abstract class Router {
  static final router = GoRouter(
    routes: [
      GoRoute(
        name: RouterName.root,
        path: RouterName.root,
        builder: (context, state) => FlowBuilder<AppStatus>(
          state: context.select((AppBloc bloc) => bloc.state.status),
          onGeneratePages: onGenerateAppViewPages,
        ),
      ),
      GoRoute(
        name: RouterName.homeRoute,
        path: RouterName.homeRoute,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: RouterName.loginRoute,
        path: RouterName.loginRoute,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: RouterName.signupRoute,
        path: RouterName.signupRoute,
        builder: (context, state) => const SignUpPage(),
      ),
      // GoRoute(
      //   name: RouterName.verificationRoute,
      //   path: RouterName.verificationRoute,
      //   builder: (context, state) => const VerificationPage(),
      // ),
      GoRoute(
        name: RouterName.profileRoute,
        path: RouterName.profileRoute,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        name: RouterName.setPomodoroRoute,
        path: RouterName.setPomodoroRoute,
        builder: (context, state) => const SetPomodoroPage(),
      ),
      GoRoute(
        name: RouterName.setTimerRoute,
        path: RouterName.setTimerRoute,
        builder: (context, state) => const SetTimerPage(),
      ),
      GoRoute(
        name: RouterName.setAlarmRoute,
        path: RouterName.setAlarmRoute,
        builder: (context, state) => const SetAlarmPage(),
      ),
      GoRoute(
        name: RouterName.startTimerClockRoute,
        path: RouterName.startTimerClockRoute,
        builder: (context, state) => StartClockPage(
          timerCubit: state.extra! as TimerCubit,
        ),
      )
    ],
  );
}

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
