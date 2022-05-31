import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            await showDialog<String?>(
              context: context,
              builder: (context) => const _UserAvatarDialog(),
            ).then((value) {
              if (value != null) {
                context.read<SettingsCubit>().updateProfilePhoto(value);
              }
            });
          },
          child: CircleAvatar(
            radius: 60,
            backgroundImage: state.user.photo != null
                ? NetworkImage(state.user.photo!)
                : null,
          ),
        );
      },
    );
  }
}

class _UserAvatarDialog extends StatelessWidget {
  const _UserAvatarDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('User Avatar'),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      children: [
        Wrap(
          children: List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () =>
                    Navigator.pop(context, 'https://picsum.photos/200/'),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://picsum.photos/200/'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
