import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'alarm_state.dart';

class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit() : super(AlarmInitial());
}
