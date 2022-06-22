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

  Future<void> updateProfileName(String name) async {
    await _authenticationRepository.updateDisplayName(name);
  }

  Future<void> updateProfileEmail(String email) async {
    await _authenticationRepository.updateProfileEmail(email);
  }

  Future<void> updateProfilePassword(
    String email,
    String oldPassword,
    String newPassword,
  ) async {
    await _authenticationRepository.updateProfilePassword(
      email,
      oldPassword,
      newPassword,
    );
  }

  Future<void> deleteProfile(String email, String password) async {
    await _authenticationRepository.deleteAccount(email, password);
  }

  Future<bool> isEmailVerified() async {
    return _authenticationRepository.checkVerification();
  }

  Future<void> resendVerificationMail() async {
    await _authenticationRepository.sendVerificationMail();
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
