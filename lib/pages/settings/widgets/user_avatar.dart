import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return WidgetCircularAnimator(
          child: CircleAvatar(
            radius: 65,
            backgroundColor: const Color(0xff6e5e5d),
            child: Material(
              shape: const CircleBorder(),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: InkWell(
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
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: state.user.photo == null
                      ? const Center(
                          child: Icon(
                            LineIcons.userPlus,
                            color: Colors.white,
                            size: 42,
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: state.user.photo!,
                          filterQuality: FilterQuality.high,
                        ),
                ),
              ),
            ),
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
      title: Text(
        'Choose Avatar',
        style: GoogleFonts.dmSerifDisplay(fontSize: 26),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      children: [
        Wrap(
          children: List.generate(
            profileUrls.length - 1,
            (index) => CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: Material(
                shape: const CircleBorder(),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.pop(context, profileUrls[index]),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CachedNetworkImage(imageUrl: profileUrls[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
