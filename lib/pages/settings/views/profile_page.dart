import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/settings/widgets/user_avatar.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppBloc>().state.user;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: kDefaultHorizontalPadding,
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
              DetailTile(title: 'Name', text: user.name!),
              const Divider(),
              DetailTile(title: 'Email', text: user.email!),
              const Divider(),
              DetailTile(title: 'Last login', text: user.lastLoginAt!.format()),
              const VSpace(40),
              _LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailTile extends StatelessWidget {
  const DetailTile({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: title.text.gray400
              .textStyle(
                GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                ),
              )
              .make(),
        ),
        Expanded(
          flex: 3,
          child: CupertinoTextField.borderless(
            readOnly: true,
            placeholder: text,
            placeholderStyle: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class _LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlueButton(
      title: 'Logout',
      onPressed: () {
        context.read<AppBloc>().add(AppLogoutRequested());
        GoRouter.of(context).pop();
      },
    );
  }
}
