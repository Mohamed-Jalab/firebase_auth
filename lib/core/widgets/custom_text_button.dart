import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        foregroundColor: secondaryColor,
      ),
      child: Text(
        title,
        style:
            const TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
      ),
    );
  }
}
