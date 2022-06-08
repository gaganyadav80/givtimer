// ignore_for_file: avoid_positional_boolean_parameters

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState());

  void setDuration(Duration value) {
    final seconds = value.inSeconds;
    emit(state.copyWith(duration: value, seconds: seconds));
  }

  void setActivityName(String value) => emit(
        state.copyWith(
          activityName: value.trim(),
          activityKey: value.trim().toLowerCase(),
        ),
      );

  bool isTimerSet() => state.seconds > 0;

  int getDurationInSeconds() => state.seconds;

  int getDurationHours() {
    final hours = state.seconds ~/ 3600;
    return hours;
  }

  int getDurationMinutes() {
    final minutes = (state.seconds % 3600) ~/ 60;
    return minutes;
  }

  TextFormat getTextFormat() {
    if (state.seconds >= 3600) {
      return TextFormat.HH_MM_SS;
    } else {
      return TextFormat.MM_SS;
    }
  }
}
