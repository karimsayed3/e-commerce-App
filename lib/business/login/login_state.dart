part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  UserData userData;
  LoginSuccessState(this.userData);
}

class LoginFailState extends LoginState {}