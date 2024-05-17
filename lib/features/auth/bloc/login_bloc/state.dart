part of 'bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class ChangeVisiblePasswordState extends LoginState {}

class LoadingState extends LoginState {}

class SuccessState extends LoginState {
  final UserModel userModel;

  SuccessState({required this.userModel});
}

class FailureState extends LoginState {
  final String message;

  FailureState({required this.message});
}
