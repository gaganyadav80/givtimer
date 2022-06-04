import 'package:flutter/material.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class TopHeadAndActivityNameWidget extends StatelessWidget {
  const TopHeadAndActivityNameWidget({
    Key? key,
    required this.title,
    this.onTextChanged,
  }) : super(key: key);

  final String title;
  final TextChangeCallback? onTextChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.dmSerifDisplay(
            textStyle: Theme.of(context).textTheme.headline2,
          ),
        ),
        const VSpace(10),
        CustomTextField(
          hintText: 'Activity Name',
          textInputType: TextInputType.name,
          prefixIcon: const Icon(LineIcons.alternateFeather),
          textInputAction: TextInputAction.done,
          maxLines: 1,
          textCapitalization: TextCapitalization.words,
          onChanged: onTextChanged,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kPurpleColor),
          ),
        ),
        const VSpace(20),
        const Divider(thickness: 1),
      ],
    );
  }
}
