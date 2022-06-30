import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/pages/settings/views/verify_email.dart';
import 'package:givtimer/routes.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isVerified = context.read<AppBloc>().state.user.isVerified!;

    return SettingsList(
      // lightTheme: SettingsThemeData(
      //   settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
      //   settingsSectionBackground: Colors.grey[350],
      //   dividerColor: Colors.black26,
      // ),
      physics: const NeverScrollableScrollPhysics(),
      sections: [
        SettingsSection(
          title: const Text('General'),
          tiles: [
            if (!isVerified)
              SettingsTile(
                title: const Text('Verify Email'),
                leading:
                    const Icon(LineIcons.exclamationCircle, color: Colors.red),
                trailing: const Icon(LineIcons.angleRight, color: Colors.grey),
                onPressed: (_) => context.pushMaterial(
                  BlocProvider.value(
                    value: context.read<SettingsCubit>(),
                    child: const VerifyEmailPage(),
                  ),
                ),
              ),
            SettingsTile(
              title: const Text('Profile'),
              leading: const Icon(LineIcons.user),
              trailing: const Icon(LineIcons.angleRight, color: Colors.grey),
              onPressed: (_) => context.pushNamed(RouterName.profileRoute),
            ),
          ],
        ),
        SettingsSection(
          title: const Text('Appearance'),
          tiles: [
            SettingsTile.switchTile(
              title: const Text('Menu Position to Right'),
              leading: const Icon(LineIcons.history),
              initialValue: context.read<SettingsCubit>().state.menuToRight,
              onToggle: (_) => context.read<SettingsCubit>().toggleMenuLayout(),
              activeSwitchColor: kPurpleColor,
              // onPressed: (_) => context.read<SettingsCubit>().changeMenuLayout(),
            ),
          ],
        ),
        SettingsSection(
          title: const Text('Activity'),
          tiles: [
            SettingsTile(
              title: const Text('Logs'),
              leading: const Icon(LineIcons.history),
              trailing: const Icon(LineIcons.angleRight, color: Colors.grey),
              onPressed: (_) => context.pushNamed(RouterName.activityLogsRoute),
            ),
          ],
        ),
      ],
    );
  }
}
