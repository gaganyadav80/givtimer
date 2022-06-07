import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pomodoro_state.dart';

class PomodoroCubit extends Cubit<PomodoroState> {
  PomodoroCubit() : super(const PomodoroState());

  void pomodoroDuration(double value) =>
      emit(state.copyWith(focusDuration: value));

  void breakDuration(double value) =>
      emit(state.copyWith(breakDuration: value));

  void longBreakDuration(double value) =>
      emit(state.copyWith(longBreakDuration: value));

  void pomodoroCount(double value) =>
      emit(state.copyWith(setsCount: value.roundToDouble()));

  void activityName(String value) => emit(
        state.copyWith(
          activityName: value,
          activityKey: value.trim().toLowerCase(),
        ),
      );

  int focusDurationInSeconds() => (state.focusDuration * 60).round();

  int breakDurationInSeconds() => (state.breakDuration * 60).round();

  int longBreakDurationInSeconds() => (state.longBreakDuration * 60).round();

  void decrementPomodoroCount() =>
      emit(state.copyWith(setsCount: state.setsCount - 1));

  void incrementPomodoroCount() =>
      emit(state.copyWith(setsCount: state.setsCount + 1));

  void resetPomodoroCount() => emit(state.copyWith(setsCount: 4));
}
