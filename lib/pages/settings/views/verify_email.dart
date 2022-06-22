import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final differece = DateTime.now().difference(
      context.read<AppBloc>().state.user.createdAt!,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kDefaultHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadlineText('Verify profile'),
            const VSpace(10),
            '''\nPlease verify your email or your account will be deleted after 24 hours of signing up.'''
                .text
                .xl2
                .red400
                .make(),
            const VSpace(20),
            'Time left: ${24 - differece.inHours} hours'.text.xl2.make(),
            const VSpace(50),
            BlueButton(
              title: 'Verify',
              onPressed: () {
                var verify = false;
                context
                    .read<SettingsCubit>()
                    .isEmailVerified()
                    .then((value) => verify = value);

                if (verify) {
                  showBasicSnackBar(context, 'Email is verified');
                  context.pop<void>();
                } else {
                  showBasicSnackBar(context, 'Email is not verified');
                }
              },
            ),
            const VSpace(20),
            BlueButton(
              title: 'Resend',
              onPressed: () {
                context.read<SettingsCubit>().resendVerificationMail();
                showBasicSnackBar(context, 'Email is sent');
              },
            ),
          ],
        ),
      ),
    );
  }
}
