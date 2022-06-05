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
      emit(state.copyWith(pomodoroCount: value.roundToDouble()));

  void activityName(String value) => emit(state.copyWith(activityName: value));

  int focusDurationInSeconds() => (state.pomodoroDuration * 60).round();

  int breakDurationInSeconds() => (state.breakDuration * 60).round();

  int longBreakDurationInSeconds() => (state.longBreakDuration * 60).round();

  void decrementPomodoroCount() =>
      emit(state.copyWith(pomodoroCount: state.pomodoroCount - 1));

  void incrementPomodoroCount() =>
      emit(state.copyWith(pomodoroCount: state.pomodoroCount + 1));

  void resetPomodoroCount() => emit(state.copyWith(pomodoroCount: 4));
}
