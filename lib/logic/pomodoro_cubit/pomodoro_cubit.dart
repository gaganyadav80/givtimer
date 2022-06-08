import 'package:equatable/equatable.dart';
import 'package:givtimer/data/data.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'pomodoro_state.dart';

class PomodoroCubit extends HydratedCubit<PomodoroState> {
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
          activityName: value.trim(),
          activityKey: value.trim().toLowerCase(),
        ),
      );

  int focusDurationInSeconds() => (state.focusDuration * 60).round();

  int breakDurationInSeconds() => (state.breakDuration * 60).round();

  int longBreakDurationInSeconds() => (state.longBreakDuration * 60).round();

  void addTotalTimeDone(int value) =>
      emit(state.copyWith(totalSecondsDone: state.totalSecondsDone + value));

  void logActivity(int seconds) {
    PomodoroModel().addActivity(state.activityKey, seconds);
    addTotalTimeDone(seconds);
  }

  @override
  PomodoroState? fromJson(Map<String, dynamic> json) {
    return PomodoroState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(PomodoroState state) {
    return state.toMap();
  }
}
