import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pomodoro_state.dart';

class PomodoroCubit extends Cubit<PomodoroState> {
  PomodoroCubit() : super(const PomodoroState());

  void pomodoroDuration(double value) =>
      emit(state.copyWith(pomodoroDuration: value));

  void breakDuration(double value) =>
      emit(state.copyWith(breakDuration: value));

  void longBreakDuration(double value) =>
      emit(state.copyWith(longBreakDuration: value));

  void pomodoroCount(double value) =>
      emit(state.copyWith(pomodoroCount: value));
}
