import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: secondaryColor,
              title: const Text('Home Screen', style: TextStyle(color: whiteColor),),
            ),
            body: const Center(
              child: Text('Home Screen'),
            )));
  }
}
