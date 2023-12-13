part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class getLogin extends AuthEvent {
  String? email;
  String? password;

  getLogin({required this.email, required this.password});
}
