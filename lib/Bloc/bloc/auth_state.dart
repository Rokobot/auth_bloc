part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class loginLoading extends AuthState {}

class loginLoaded extends AuthState {}

class loginsucces extends AuthState {}

class loginError extends AuthState {
  String? error;
  loginError({this.error});
}
