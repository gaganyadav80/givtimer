import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:givtimer/utils/utils.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        // color: Theme.of(context).scaffoldBackgroundColor,
        // primary: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: kBorderRadius,
          side: kInputBorderStyle.borderSide,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/google.svg',
            // fit: BoxFit.contain,
            height: 26,
            width: 26,
          ),
          const HSpace(20),
          Text(title, style: Theme.of(context).textTheme.button)
        ],
      ),
    );
  }
}
