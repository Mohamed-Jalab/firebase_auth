import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';

part 'event.dart';
part 'state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool visible = false;
  LoginBloc() : super(LoginInitial()) {
    on<ChangeVisiblePasswordEvent>((event, emit) {
      visible = !visible;
      emit(ChangeVisiblePasswordState());
    });
    on<TryLoginEvent>((event, emit) async {
      emit(LoadingState());
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.userModel.email,
          password: event.userModel.password,
        );
        emit(SuccessState(
            userModel: event.userModel));
      } on FirebaseAuthException catch (erorr) {
        if (erorr.code == "user-not-found") {
          emit(FailureState(message: "No user found for this email."));
        } else if (erorr.code == "wrong-password") {
          emit(FailureState(message: "Wrong password."));
        } else if (erorr.code == "invalid-credential") {
          emit(FailureState(message: "Invalid-credential."));
        } else {
          emit(FailureState(message: "Unknown error."));
        }
      } 
      catch (e) {
        emit(FailureState(message: e.toString()));
      }
    });
  }
}
