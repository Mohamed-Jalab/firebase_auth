import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

part 'event.dart';
part 'state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool visible = false;
  SignUpBloc() : super(SignUpInitial()) {
    on<ChangeVisiblePasswordEvent>((event, emit) {
      visible = !visible;
      emit(ChangeVisiblePasswordState());
    });
    on<TrySignUpEvent>((event, emit) async {
      try {
        emit(LoadingState());
        FirebaseAuth user = FirebaseAuth.instance;
        await user.createUserWithEmailAndPassword(
            email: event.userModel.email, password: event.userModel.password);
        emit(SuccessState(
            userModel: UserModel(
                email: emailController.text,
                password: passwordController.text,
                username: usernameController.text)));
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          emit(FailureState(message: "Your password is weak"));
        } else if (e.code == "email-already-in-use") {
          emit(FailureState(
              message: "The account already exists for that email."));
        } else {
          emit(FailureState(message: "Unknown error."));
        }
      } catch (e) {
        emit(FailureState(message: e.toString()));
      }
    });
  }
}
