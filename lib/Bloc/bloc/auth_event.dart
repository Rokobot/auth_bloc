part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class getLogin extends AuthEvent {
  String? email;
  String? password;

  getLogin({required this.email, required this.password});
}

class getSignup extends AuthEvent {
  String? username;
  String? email;
  String? password;

  getSignup({this.username, this.email, this.password});
}
