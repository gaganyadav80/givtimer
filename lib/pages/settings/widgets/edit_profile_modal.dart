// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileModal extends StatefulWidget {
  const EditProfileModal({Key? key}) : super(key: key);

  @override
  State<EditProfileModal> createState() => _EditProfileModalState();
}

class _EditProfileModalState extends State<EditProfileModal> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _oldpasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppBloc>().state.user;
    _emailController.text = user.email!;
    _nameController.text = user.name!;

    return FractionallySizedBox(
      heightFactor: 0.9,
      child: BuildModalChild(
        child: Column(
          children: [
            Padding(
              padding: kDefaultHorizontalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpace(10),
                  Center(
                    child: Container(
                      height: 6,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  const VSpace(20),
                  Text(
                    'Update Details',
                    style: GoogleFonts.dmSerifDisplay(
                      textStyle: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  const VSpace(10),
                  const Text(
                    'Please provide old password also which will be used to reauthenticate you.',
                  ),
                  const VSpace(20),
                  _updateDetailTile('Name', user.name!, _nameController),
                  const Divider(),
                  _updateDetailTile('Email', user.email!, _emailController),
                  const Divider(),
                  _updateDetailTile(
                    'Old Pass',
                    '**********',
                    _oldpasswordController,
                  ),
                  const Divider(),
                  _updateDetailTile(
                    'New Pass',
                    '**********',
                    _passwordController,
                  ),
                  const VSpace(50),
                  BlueButton(
                    title: 'Update',
                    onPressed: () {
                      if (_oldpasswordController.text.isEmpty) {
                        showEmptyPassDialog();
                        return;
                      }
                      if (user.name! != _nameController.text) {
                        context
                            .read<SettingsCubit>()
                            .updateProfileName(_nameController.text);
                      }
                      if (user.email! != _emailController.text) {
                        context.read<SettingsCubit>().updateProfileEmail(
                              _emailController.text,
                            );
                      }
                      if (_passwordController.text.isNotEmpty) {
                        context.read<SettingsCubit>().updateProfilePassword(
                              user.email!,
                              _oldpasswordController.text,
                              _passwordController.text,
                            );
                      }
                    },
                  ),
                ],
              ),
            ),
            const VSpace(40),
            const Divider(height: 0, thickness: 1),
            Container(
              height: 50,
              color: Colors.white,
              width: context.screenWidth,
              padding: kDefaultHorizontalPadding,
              child: 'Delete Account'
                  .text
                  .medium
                  .color(CupertinoColors.destructiveRed.withOpacity(0.8))
                  .make()
                  .objectCenterLeft(),
            ).onTap(
              () async {
                if (_oldpasswordController.text.isEmpty) {
                  await showEmptyPassDialog();
                } else {
                  await showDeleteAccountDialog();
                }
              },
            ),
            const Divider(height: 0, thickness: 1),
          ],
        ),
      ),
    );
  }

  Future<void> showEmptyPassDialog() {
    return showCupertinoDialog<void>(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          content: const Text('Please enter old password'),
          title: const Text('Password'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              isDefaultAction: true,
              child: const Text('Okay'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteAccountDialog() {
    return showCupertinoDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (_) {
        return CupertinoAlertDialog(
          content: const Text(
            'Are you sure you want to delete your account?',
          ),
          title: const Text('Delete Account'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              isDefaultAction: true,
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                context.read<SettingsCubit>().deleteProfile(
                      _emailController.text,
                      _passwordController.text,
                    );
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  Widget _updateDetailTile(
    String title,
    String text,
    TextEditingController controller,
  ) {
    return Row(
      children: [
        Expanded(child: title.text.gray400.make()),
        Expanded(
          flex: 3,
          child: CupertinoTextField.borderless(
            // readOnly: true,
            controller: controller,
            placeholder: text,
          ),
        ),
      ],
    );
  }
}
