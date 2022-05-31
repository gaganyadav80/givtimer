import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/settings/widgets/user_avatar.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: GoogleFonts.dmSerifDisplay(
                  textStyle: Theme.of(context).textTheme.headline2,
                ),
              ),
              const VSpace(20),
              const UserAvatar(),
              const VSpace(20),
              Text(
                'Name: ${context.read<AppBloc>().state.user.name}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const VSpace(20),
              Text(
                'Email: ${context.read<AppBloc>().state.user.email}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const VSpace(20),
              Text(
                'Last login: ${context.read<AppBloc>().state.user.lastLoginAt}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const VSpace(20),
              _LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlueButton(
      title: 'Logout',
      onPressed: () => context.read<SettingsCubit>().logout(),
    );
  }
}
