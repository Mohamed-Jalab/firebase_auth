part of 'bloc.dart';

abstract class SignUpEvent {}

class ChangeVisiblePasswordEvent extends SignUpEvent {}

class TrySignUpEvent extends SignUpEvent {
  final UserModel userModel;

  TrySignUpEvent({required this.userModel});
}
