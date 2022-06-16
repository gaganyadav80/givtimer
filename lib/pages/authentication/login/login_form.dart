import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:givtimer/data/hive_helper.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/routes.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          HiveHelper().initUserData(context.read<AppBloc>().state.user.id);
        }
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultHorizontalPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Givtimer',
                style: GoogleFonts.dmSerifDisplay(
                  textStyle: Theme.of(context).textTheme.headline2,
                ),
              ),
              _SignUpButton(),
              const VSpace(30),
              _EmailInput(),
              const VSpace(12),
              _PasswordInput(),
              const VSpace(30),
              _LoginButton(),
              const VSpace(12),
              _GoogleLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomTextField(
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          textInputType: TextInputType.emailAddress,
          hintText: 'Email',
          maxLines: 1,
          prefixIcon: state.email.invalid
              ? const Icon(LineIcons.exclamation, color: Colors.red)
              : const Icon(LineIcons.envelope),
          textInputAction: TextInputAction.next,
          errorText: state.email.invalid ? '' : null,
          showErrorText: false,
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.isLoginObscure != current.isLoginObscure,
      builder: (context, state) {
        return CustomTextField(
          onChanged: (email) =>
              context.read<LoginCubit>().passwordChanged(email),
          textInputType: TextInputType.visiblePassword,
          hintText: 'Password',
          maxLines: 1,
          prefixIcon: const Icon(LineIcons.lock),
          textInputAction: TextInputAction.done,
          obscureText: state.isLoginObscure,
          suffix: state.isLoginObscure
              ? IconButton(
                  icon: const Icon(LineIcons.eyeSlash, color: Colors.grey),
                  onPressed: () =>
                      context.read<LoginCubit>().toggleLoginObscure(),
                )
              : IconButton(
                  icon: const Icon(LineIcons.eye),
                  onPressed: () =>
                      context.read<LoginCubit>().toggleLoginObscure(),
                ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == FormzStatus.submissionInProgress
            ? const BlueButton(isLoading: true)
            : Hero(
                tag: 'auth-button-hero',
                child: BlueButton(
                  title: 'Login',
                  onPressed: () =>
                      context.read<LoginCubit>().logInWithCredentials(),
                ),
              );
      },
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GoogleButton(
      title: 'Sign in with google',
      onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Don't have an account?",
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const HSpace(5),
        TextButton(
          key: const Key('loginForm_createAccount_flatButton'),
          onPressed: () => context.pushNamed(RouterName.signupRoute),
          child: const Text('Create Account'),
        ),
      ],
    );
  }
}
