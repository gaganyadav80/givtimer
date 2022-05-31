import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit(this._authenticationRepository) : super(const SettingsState());

  final AuthenticationRepository _authenticationRepository;

  Future<void> updateProfilePhoto(String url) async {
    await _authenticationRepository.updateProfilePhoto(url);
  }

  Future<void> logout() async {
    try {
      await _authenticationRepository.logOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return const SettingsState();
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return <String, dynamic>{};
  }
}
