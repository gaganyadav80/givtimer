import 'package:flutter/material.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:givtimer/widgets/src/circular_loading.dart';
import 'package:velocity_x/velocity_x.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    Key? key,
    this.title,
    this.onPressed,
    this.isLoading = false,
    this.child,
    this.height,
    this.backgroundColor,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? title;

  /// If [isLoading] is true then it will override both
  /// [child] and [title].
  final bool isLoading;

  /// If [child] is null then [title] will be used
  /// Otherwise, [child] will override [title]
  final Widget? child;

  /// Default value is 60.
  final double? height;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: kBorderRadius,
      color: Colors.transparent,
      shadowColor: Theme.of(context).primaryColor.withOpacity(0.5),
      child: SizedBox(
        height: height ?? 60,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            elevation: 0,
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
            padding: const EdgeInsets.symmetric(vertical: 15),
            primary: Colors.lightBlue[900],
          ),
          child: Center(
            child: isLoading
                ? const CircularLoading(color: Colors.white)
                : child ?? title!.text.xl.light.white.make(),
          ),
        ),
      ),
    );
  }
}

class BorderTextButton extends StatelessWidget {
  const BorderTextButton({
    Key? key,
    this.title,
    required this.onPressed,
    this.isLoading = false,
    this.child,
    this.height,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? title;

  /// If [isLoading] is true then it will override both
  /// [child] and [title].
  final bool isLoading;

  /// If [child] is null then [title] will be used
  /// Otherwise, [child] will override [title]
  final Widget? child;

  /// Default value is 60.
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60,
      child: TextButton(
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
        child: Center(
          child: isLoading
              ? const CircularLoading()
              : child ?? title!.text.buttonText(context).make(),
        ),
      ),
    );
  }
}
