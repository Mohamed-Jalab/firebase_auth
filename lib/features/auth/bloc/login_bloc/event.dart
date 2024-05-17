part of 'bloc.dart';

abstract class LoginEvent {}

class ChangeVisiblePasswordEvent extends LoginEvent {}

class TryLoginEvent extends LoginEvent {
  final UserModel userModel;

  TryLoginEvent({required this.userModel});
}
