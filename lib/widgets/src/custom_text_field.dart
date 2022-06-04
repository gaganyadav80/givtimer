import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:givtimer/theme.dart';

typedef TextChangeCallback = void Function(String value);

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.textInputType,
    this.prefixIcon,
    this.textInputAction,
    this.maxLines,
    this.fieldController,
    this.errorText,
    this.showErrorText = true,
    this.currentNode,
    this.nextNode,
    this.obscureText,
    this.enabled,
    this.readOnly,
    this.suffix,
    this.textCapitalization,
    this.inputFormatters,
    this.maxLength,
    this.onChanged,
    this.enabledBorder,
  }) : super(key: key);

  final TextEditingController? fieldController;
  final String hintText;
  final String? errorText;
  final bool showErrorText;
  final TextInputType? textInputType;
  final bool? obscureText;
  final int? maxLines;
  final bool? enabled;
  final bool? readOnly;
  final Widget? suffix;
  final TextInputAction? textInputAction;
  final FocusNode? currentNode;
  final FocusNode? nextNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final Icon? prefixIcon;
  final int? maxLength;
  final TextChangeCallback? onChanged;
  final InputBorder? enabledBorder;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: currentNode,
      controller: fieldController,
      onSubmitted: (value) {
        if (currentNode != null) {
          currentNode!.unfocus();
          FocusScope.of(context).requestFocus(nextNode);
        }
      },
      onChanged: onChanged,
      textInputAction: textInputAction,
      enabled: enabled,
      readOnly: readOnly ?? false,
      maxLines: maxLines,
      maxLength: maxLength,
      maxLengthEnforcement:
          maxLength != null ? MaxLengthEnforcement.enforced : null,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(fontSize: 14),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        errorText: errorText,
        enabledBorder: enabledBorder,
        // border: kInputBorderStyle,
        // focusedBorder: kInputBorderStyle,
        // enabledBorder: kInputBorderStyle,
        // hintStyle:
        // Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.w),
        errorStyle:
            showErrorText ? null : const TextStyle(fontSize: 0, height: 0),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 19),
        hintText: hintText,
      ),
    );
  }
}
