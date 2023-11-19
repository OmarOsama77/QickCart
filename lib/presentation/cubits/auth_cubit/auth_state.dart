part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}




class SignupLoading extends AuthState{}

class SignupSuccess extends AuthState{}

class SignupFailed extends AuthState{
 String errorMessage;

 SignupFailed(this.errorMessage);
}


class loginLoading extends AuthState{}

class loginSuccess extends AuthState{}

class loginFailed extends AuthState{
  String errorMessage;

  loginFailed(this.errorMessage);
}

class MaleGender extends AuthState{

}

class FemaleGender extends AuthState{

}