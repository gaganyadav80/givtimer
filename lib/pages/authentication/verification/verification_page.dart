// ignore_for_file: lines_longer_than_80_chars
// import 'package:authentication_repository/authentication_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:givtimer/logic/logic.dart';
// import 'package:givtimer/routes.dart';
// import 'package:givtimer/utils/utils.dart';
// import 'package:givtimer/widgets/widgets.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:line_icons/line_icons.dart';

// class VerificationPage extends StatelessWidget {
//   const VerificationPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         actions: [
//           TextButton.icon(
//             onPressed: () => context.pushNamed(RouterName.homeRoute),
//             icon: const Icon(LineIcons.arrowRight),
//             label: const Text('Skip'),
//           ),
//         ],
//       ),
//       body: BlocProvider(
//         create: (context) =>
//             VerificationCubit(context.read<AuthenticationRepository>()),
//         child: const _VerificationPageBody(),
//       ),
//     );
//   }
// }

// class _VerificationPageBody extends StatelessWidget {
//   const _VerificationPageBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<VerificationCubit, VerificationState>(
//       listener: (context, state) {
//         if (state is VerificationSuccess) {
//           showBasicSnackBar(context, 'Verification successful');
//           context.pushNamed(RouterName.homeRoute);
//         } else if (state is VerificationFailed) {
//           showBasicSnackBar(context, 'Email is not verified');
//         } else if (state is ResendVerificationFailed) {
//           showBasicSnackBar(context, state.message!);
//         } else if (state is ResendVerificationSuccess) {
//           showBasicSnackBar(context, 'Verification email sent');
//         } else if (state is VerificationLogoutSuccess) {
//           context.goNamed(RouterName.root);
//         } else if (state is VerificationLogoutFailed) {
//           showBasicSnackBar(context, 'Logout failed');
//         }
//       },
//       child: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Verification',
//                   style: GoogleFonts.dmSerifDisplay(
//                     textStyle: Theme.of(context).textTheme.headline2,
//                   ),
//                 ),
//                 Text(
//                   'Please verify your email to continue. This will help us to ensure that you are a real person.',
//                   style: GoogleFonts.dmSerifDisplay(
//                     textStyle: Theme.of(context).textTheme.subtitle1,
//                   ),
//                 ),
//                 const VSpace(70),
//                 _VerificationButton(),
//                 const VSpace(20),
//                 _ResendVerificationButton(),
//                 const VSpace(30),
//                 _BackToLoginButton(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _VerificationButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<VerificationCubit, VerificationState>(
//       builder: (context, state) {
//         return state is VerificationLoading
//             ? const BlueButton(isLoading: true)
//             : BlueButton(
//                 title: 'Confirm Verification',
//                 onPressed: () =>
//                     context.read<VerificationCubit>().verifyEmail(),
//               );
//       },
//     );
//   }
// }

// class _ResendVerificationButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<VerificationCubit, VerificationState>(
//       builder: (context, state) {
//         return state is ResendVerificationLoading
//             ? const BlueButton(isLoading: true)
//             : BlueButton(
//                 title: 'Resend Verification',
//                 onPressed: () =>
//                     context.read<VerificationCubit>().resendVerification(),
//               );
//       },
//     );
//   }
// }

// class _BackToLoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final user = context.select((AppBloc bloc) => bloc.state.user);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Not ${user.email}?',
//           style: GoogleFonts.dmSerifDisplay(
//             textStyle: Theme.of(context).textTheme.subtitle1,
//           ),
//         ),
//         const VSpace(5),
//         OutlinedButton(
//           onPressed: () => context.read<VerificationCubit>().returnToLogin(),
//           child: Text(
//             'Go Back',
//             style: GoogleFonts.dmSerifDisplay(
//               textStyle: Theme.of(context).textTheme.button,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
