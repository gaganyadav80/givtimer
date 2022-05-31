import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      // lightTheme: SettingsThemeData(
      //   settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
      // ),
      sections: [
        SettingsSection(
          title: const Text('General'),
          tiles: [
            SettingsTile(
              title: const Text('Profile'),
              leading: const Icon(LineIcons.user),
              onPressed: (_) => context.pushNamed(RouterName.profileRoute),
            ),
          ],
        ),
      ],
    );
  }
}
