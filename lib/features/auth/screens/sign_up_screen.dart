import 'package:firebase_authentication/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../bloc/sign_up_bloc/bloc.dart';
import '../models/user_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.of(context).pop();
          message(context, 'Sign Up Successfully');
        }
        if (state is FailureState) {
          message(context, state.message);
        }
      },
      builder: (context, state) {
        SignUpBloc bloc = BlocProvider.of<SignUpBloc>(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const SizedBox(height: 20),
                  const Text('Welcome to Our Project!',
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: bloc.usernameController,
                    hintText: 'Username',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: bloc.emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: bloc.passwordController,
                    obscure: !bloc.visible,
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: Icon(
                          !bloc.visible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: greyColor2,
                        ),
                        onPressed: () {
                          bloc.add(ChangeVisiblePasswordEvent());
                          
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: bloc.confirmPasswordController,
                    obscure: !bloc.visible,
                    hintText: 'Confirm Password',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (bloc.passwordController.text !=
                            bloc.confirmPasswordController.text) {
                          message(context, "Uncorrect confirm password");
                        } else if (bloc.usernameController.text != '' &&
                            bloc.emailController.text != '' &&
                            bloc.passwordController.text != '' &&
                            bloc.confirmPasswordController.text != '') {
                          UserModel userModel = UserModel(
                              username: bloc.usernameController.text,
                              email: bloc.emailController.text,
                              password: bloc.passwordController.text);
                          bloc.add(TrySignUpEvent(userModel: userModel));
                        } else {
                          message(context, "Complete all fields");
                        }
                      },
                      height: 48,
                      color: secondaryColor,
                      child: const Text('Sign Up',
                          style:
                              TextStyle(fontSize: 16, fontFamily: "Poppins"))),
                  const SizedBox(height: 10),
                  if (state is LoadingState)
                    LinearProgressIndicator(
                      color: secondaryColor,
                      backgroundColor: secondaryColor.withOpacity(.2),
                    ),
                  const SizedBox(height: 30),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                          fontSize: 12),
                      children: [
                        TextSpan(
                          text: "By Signing up you agree to our ",
                          // style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: "Terms & Conditions ",
                          style: TextStyle(color: secondaryColor),
                        ),
                        TextSpan(
                          text: "and ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(color: secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
