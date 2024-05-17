part of 'bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class ChangeVisiblePasswordState extends SignUpState {}

class LoadingState extends SignUpState {}

class SuccessState extends SignUpState {
  final UserModel userModel;

  SuccessState({required this.userModel});
}

class FailureState extends SignUpState {
  final String message;

  FailureState({required this.message});

}
