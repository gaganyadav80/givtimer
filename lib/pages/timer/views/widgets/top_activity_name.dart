import 'package:flutter/material.dart';
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
        const CustomTextField(
          hintText: 'Activity Name',
          textInputType: TextInputType.name,
          prefixIcon: Icon(LineIcons.alternateFeather),
          textInputAction: TextInputAction.done,
          maxLines: 1,
          textCapitalization: TextCapitalization.words,
        ),
        const VSpace(20),
        const Divider(thickness: 1),
      ],
    );
  }
}
