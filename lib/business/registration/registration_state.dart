part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationSuccessState extends RegistrationState {
  UserData userData;
  RegistrationSuccessState(this.userData);
}

class RegistrationFailState extends RegistrationState {}
