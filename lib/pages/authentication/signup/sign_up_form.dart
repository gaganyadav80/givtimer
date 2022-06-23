import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:givtimer/data/hive_helper.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          HiveHelper().initUserData(context.read<AppBloc>().state.user.id);

          showBasicSnackBar(context, 'Verification mail is sent');
          context.pop();
        } else if (state.status.isSubmissionFailure) {
          showBasicSnackBar(context, state.errorMessage ?? 'Sign Up Failure');
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: kDefaultHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeadlineText('Register'),
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
        ),
      ),
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
