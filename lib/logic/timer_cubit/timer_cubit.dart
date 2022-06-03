// ignore_for_file: avoid_positional_boolean_parameters

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState());

  void usePomodoro(bool value) {
    emit(state.copyWith(usePomodoro: value));
  }

  void pomodoroDuration(double value) {
    emit(state.copyWith(pomodoroDuration: value));
  }

  void breakDuration(double value) {
    emit(state.copyWith(breakDuration: value));
  }

  void longBreakDuration(double value) {
    emit(state.copyWith(longBreakDuration: value));
  }

  void pomodoroCount(double value) {
    emit(state.copyWith(pomodoroCount: value));
  }
}
