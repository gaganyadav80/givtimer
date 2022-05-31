import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef TextChangeCallback = void Function(String value);

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.prefixIcon,
    required this.textInputAction,
    required this.maxLines,
    this.fieldController,
    this.errorText,
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
  }) : super(key: key);

  final TextEditingController? fieldController;
  final String hintText;
  final String? errorText;
  final TextInputType keyboardType;
  final bool? obscureText;
  final int maxLines;
  final bool? enabled;
  final bool? readOnly;
  final Widget? suffix;
  final TextInputAction textInputAction;
  final FocusNode? currentNode;
  final FocusNode? nextNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final Icon prefixIcon;
  final int? maxLength;
  final TextChangeCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: currentNode,
      onSubmitted: (value) {
        if (currentNode != null) {
          currentNode!.unfocus();
          FocusScope.of(context).requestFocus(nextNode);
        }
      },
      onChanged: onChanged,
      textInputAction: textInputAction,
      enabled: enabled ?? true,
      readOnly: readOnly ?? false,
      maxLines: maxLines,
      maxLength: maxLength,
      maxLengthEnforcement:
          maxLength != null ? MaxLengthEnforcement.enforced : null,
      controller: fieldController,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(fontSize: 14),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        errorText: errorText,
        // border: kInputBorderStyle,
        // focusedBorder: kInputBorderStyle,
        // enabledBorder: kInputBorderStyle,
        // hintStyle:
        // Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.w),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 19),
        hintText: hintText,
      ),
    );
  }
}
