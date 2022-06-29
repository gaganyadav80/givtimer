import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:givtimer/data/data.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          FireDBHelper().init(
            context.read<AppBloc>().state.user.id,
            onSignUp: true,
          );

          showBasicSnackBar(context, 'Verification mail is sent');
          context.pop();
        } else if (state.status.isSubmissionFailure) {
          showBasicSnackBar(context, state.errorMessage ?? 'Sign Up Failure');
        }
      },
      child: Row(
        children: [
          const ResponsiveVisibility(
            visible: false,
            visibleWhen: [Condition<bool>.largerThan(name: TABLET)],
            child: Expanded(
              child: FlutterLogo(
                size: 128,
              ),
            ),
          ),
          Expanded(
            child: ResponsiveValue<int>(
                      context,
                      defaultValue: 0,
                      valueWhen: [
                        const Condition<int>.smallerThan(
                          name: TABLET,
                          value: 0,
                        ),
                        const Condition<int>.largerThan(name: MOBILE, value: 1),
                      ],
                    ).value ==
                    0
                ? SingleChildScrollView(child: _buildBody())
                : _buildBody(),
          ),
        ],
      ),
    );
  }

  Padding _buildBody() => Padding(
        padding: kDefaultHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeadlineText('Register'),
            const ResponsiveVisibility(
              visible: false,
              visibleWhen: [Condition<bool>.largerThan(name: TABLET)],
              child: _BackToLoginButton(),
            ),
            const VSpace(30),
            _NameInput(),
            const VSpace(12),
            _EmailInput(),
            const VSpace(12),
            _PasswordInput(),
            const VSpace(12),
            _ConfirmPasswordInput(),
            const VSpace(30),
            _SignUpButton(),
            const VSpace(12),
            _GoogleLoginButton(),
          ],
        ),
      );
}

class _BackToLoginButton extends StatelessWidget {
  const _BackToLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Back to login?',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const HSpace(5),
        TextButton(
          key: const Key('loginForm_createAccount_flatButton'),
          onPressed: () => context.pop(),
          child: const Text('Login instead'),
        ),
      ],
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Name',
      textInputType: TextInputType.name,
      prefixIcon: const Icon(LineIcons.user),
      textInputAction: TextInputAction.next,
      maxLines: 1,
      onChanged: (name) => context.read<SignUpCubit>().nameChanged(name),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomTextField(
          hintText: 'Email',
          textInputType: TextInputType.emailAddress,
          prefixIcon: state.email.invalid
              ? const Icon(LineIcons.exclamation, color: Colors.red)
              : const Icon(LineIcons.envelope),
          textInputAction: TextInputAction.next,
          maxLines: 1,
          onChanged: (name) => context.read<SignUpCubit>().emailChanged(name),
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
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.isPasswordObscure != current.isPasswordObscure,
      builder: (context, state) {
        return CustomTextField(
          onChanged: (password) =>
              context.read<SignUpCubit>().passwordChanged(password),
          textInputType: TextInputType.visiblePassword,
          hintText: 'Password',
          maxLines: 1,
          prefixIcon: const Icon(LineIcons.lock),
          textInputAction: TextInputAction.next,
          obscureText: state.isPasswordObscure,
          suffix: state.isPasswordObscure
              ? IconButton(
                  icon: const Icon(LineIcons.eyeSlash, color: Colors.grey),
                  onPressed: () {
                    context.read<SignUpCubit>().togglePasswordObscure();
                  },
                )
              : IconButton(
                  icon: const Icon(LineIcons.eye),
                  onPressed: () =>
                      context.read<SignUpCubit>().togglePasswordObscure(),
                ),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.isConfirmPasswordObscure != current.isConfirmPasswordObscure,
      builder: (context, state) {
        return CustomTextField(
          onChanged: (cpass) =>
              context.read<SignUpCubit>().confirmedPasswordChanged(cpass),
          textInputType: TextInputType.visiblePassword,
          hintText: 'Confirm Password',
          maxLines: 1,
          prefixIcon: const Icon(LineIcons.lock),
          textInputAction: TextInputAction.done,
          obscureText: state.isConfirmPasswordObscure,
          suffix: state.isConfirmPasswordObscure
              ? IconButton(
                  icon: const Icon(LineIcons.eyeSlash, color: Colors.grey),
                  onPressed: () => context
                      .read<SignUpCubit>()
                      .toggleConfirmPasswordObscure(),
                )
              : IconButton(
                  icon: const Icon(LineIcons.eye),
                  onPressed: () => context
                      .read<SignUpCubit>()
                      .toggleConfirmPasswordObscure(),
                ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const BlueButton(isLoading: true)
            : Hero(
                tag: 'auth-button-hero',
                child: BlueButton(
                  title: 'Sign Up',
                  onPressed: () =>
                      context.read<SignUpCubit>().signUpFormSubmitted(),
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
      title: 'Sign up with google',
      onPressed: () => context.read<SignUpCubit>().logInWithGoogle(),
    );
  }
}
