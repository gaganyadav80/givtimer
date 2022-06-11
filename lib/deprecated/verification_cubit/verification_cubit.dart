// import 'package:authentication_repository/authentication_repository.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// part 'verification_state.dart';

// class VerificationCubit extends Cubit<VerificationState> {
//   VerificationCubit(this._authenticationRepository)
//       : super(VerificationInitial());

//   final AuthenticationRepository _authenticationRepository;

//   void verifyEmail() {
//     emit(VerificationLoading());

//     final isUserVerified = _authenticationRepository.currentUser.isVerified!;

//     if (isUserVerified) {
//       emit(VerificationSuccess());
//     } else {
//       emit(VerificationFailed());
//     }
//   }

//   Future<void> resendVerification() async {
//     emit(ResendVerificationLoading());

//     try {
//       await _authenticationRepository.sendVerificationEmail();
//       emit(ResendVerificationSuccess());
//     } on SendVerificationEmailFailure catch (_) {
//       emit(
//         const ResendVerificationFailed(
//           message: 'Failed to send verification email',
//         ),
//       );
//     }
//   }

//   Future<void> returnToLogin() async {
//     try {
//       await _authenticationRepository.logOut();
//       emit(VerificationLogoutSuccess());
//     } on LogOutFailure {
//       emit(VerificationLogoutFailed());
//     }
//   }
// }
