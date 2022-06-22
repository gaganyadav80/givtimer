import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'src/build_modal_child.dart';
export 'src/circular_loading.dart';
export 'src/cupertino_superellipse.dart';
export 'src/custom_buttons.dart';
export 'src/custom_text_field.dart';
export 'src/empty_list_indicator.dart';
export 'src/google_button.dart';
export 'src/gradient_divider.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.dmSerifDisplay(
        textStyle: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
