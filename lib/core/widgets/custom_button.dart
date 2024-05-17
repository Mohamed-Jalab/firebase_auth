import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.height,
    this.onPressed,
    this.borderRadius,
    this.elevation,
  });
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;
  final double? height;
  final void Function()? onPressed;
  final BorderRadius? borderRadius;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        highlightColor: whiteColor.withOpacity(.2),
        splashColor: whiteColor.withOpacity(.2),
        elevation: elevation,
        padding: padding,
        height: height,
        textColor: whiteColor,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(15)),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
