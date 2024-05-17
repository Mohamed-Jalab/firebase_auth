import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.suffix,
    this.prefixIcon,
    required this.hintText,
    this.obscure = false,
  });
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final bool obscure;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: secondaryColor.withOpacity(.8),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? secondaryColor
                : Colors.grey),
        suffixIcon: suffix,
        contentPadding: const EdgeInsets.only(left: 20),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: secondaryColor.withOpacity(.8), width: 1.8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              BorderSide(color: Colors.grey.withOpacity(.8), width: 1.8),
        ),
      ),
    );
  }
}
