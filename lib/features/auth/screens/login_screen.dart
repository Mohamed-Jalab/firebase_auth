import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/divider_with_title.dart';
import '../bloc/login_bloc/bloc.dart';
import '../models/user_model.dart';
import 'home_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is SuccessState) {
          message(context, 'Login Successfully');
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScreen(
                    email: state.userModel.email
                  )));
        }
        if (state is FailureState) {
          message(context, state.message);
        }
      },
      builder: (context, state) {
        final LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter the email address you\'d like to use to sign in to Our Project',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: bloc.emailController,
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icons.email_outlined),
                        const SizedBox(height: 10),
                        CustomTextField(
                          prefixIcon: Icons.lock,
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (bloc.emailController.text != '' &&
                            bloc.passwordController.text != '') {
                          UserModel userModel = UserModel(
                              email: bloc.emailController.text,
                              password: bloc.passwordController.text);
                          bloc.add(TryLoginEvent(userModel: userModel));
                        } else {
                          message(context, 'Complete all fields');
                        }
                      },
                      height: 48,
                      color: secondaryColor,
                      child:
                          const Text('Log In', style: TextStyle(fontSize: 16))),
                  const SizedBox(height: 20),
                  if (state is LoadingState)
                    LinearProgressIndicator(
                        color: secondaryColor,
                        backgroundColor: secondaryColor.withOpacity(.2)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      CustomTextButton(
                        title: 'Sign Up',
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const DividerWithTitle(title: 'Or Continue with'),
                  const SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      child: Image.asset(
                        "assets/images/google-logo.png",
                        width: 33,
                        height: 33,
                      ),
                      onTap: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        message(
                            context, 'Google authentication is not supported');
                      },
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
