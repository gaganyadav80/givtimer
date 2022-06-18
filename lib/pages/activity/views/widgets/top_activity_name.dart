import 'package:flutter/material.dart';
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:substring_highlight/substring_highlight.dart';

class TopHeadAndActivityNameWidget extends StatefulWidget {
  const TopHeadAndActivityNameWidget({
    Key? key,
    required this.title,
    required this.activityNames,
    this.onTextChanged,
  }) : super(key: key);

  final String title;
  final TextChangeCallback? onTextChanged;
  final List<String> activityNames;

  @override
  State<TopHeadAndActivityNameWidget> createState() =>
      _TopHeadAndActivityNameWidgetState();
}

class _TopHeadAndActivityNameWidgetState
    extends State<TopHeadAndActivityNameWidget> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.dmSerifDisplay(
            textStyle: Theme.of(context).textTheme.headline2,
          ),
        ),
        const VSpace(10),
        Autocomplete<String>(
          optionsBuilder: (textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            } else {
              return widget.activityNames.where(
                (word) => word
                    .toUpperCase()
                    .contains(textEditingValue.text.toUpperCase()),
              );
            }
          },
          optionsViewBuilder: (context, Function(String) onSelected, options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (BuildContext context, int index) {
                      final option = options.elementAt(index);

                      return ListTile(
                        // title: Text(option.toString()),
                        // minLeadingWidth: 0,
                        // leading: const Icon(LineIcons.history),
                        title: SubstringHighlight(
                          text: option.toUpperCase(),
                          term: controller.text.toUpperCase(),
                          textStyleHighlight: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: kPurpleColor,
                          ),
                        ),
                        onTap: () => onSelected(option),
                      );
                    },
                  ),
                ),
              ),
            );
          },
          onSelected: (value) {
            controller.text = value;
            widget.onTextChanged?.call(value);
          },
          fieldViewBuilder: (_, controller, focusNode, __) {
            this.controller = controller;

            return TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: widget.onTextChanged,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: kBorderRadius,
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: kBorderRadius,
                  borderSide: const BorderSide(color: kPurpleColor),
                ),
                hintText: 'Activity Name',
                prefixIcon: const Icon(LineIcons.feather),
              ),
            );
          },
        ),
        // CustomTextField(
        //   hintText: 'Activity Name',
        //   textInputType: TextInputType.name,
        //   prefixIcon: const Icon(LineIcons.alternateFeather),
        //   textInputAction: TextInputAction.done,
        //   maxLines: 1,
        //   textCapitalization: TextCapitalization.words,
        //   onChanged: onTextChanged,
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: const BorderSide(color: kPurpleColor),
        //   ),
        // ),
        const VSpace(20),
        const Divider(thickness: 1),
      ],
    );
  }
}
