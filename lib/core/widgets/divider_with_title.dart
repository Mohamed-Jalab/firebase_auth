

import 'package:flutter/material.dart';

class DividerWithTitle extends StatelessWidget {
  const DividerWithTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Divider(
          color: Colors.grey.withOpacity(.4),
          thickness: 2,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(title, style: const TextStyle(fontFamily: 'Poppins')),
        ),
        Expanded(
            child: Divider(
          color: Colors.grey.withOpacity(.4),
          thickness: 2,
        )),
      ],
    );
  }
}
