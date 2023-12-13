part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class authLoading extends AuthState {}

class authLoaded extends AuthState {}

class authsucces extends AuthState {}

class authError extends AuthState {
  String? error;
  authError({this.error});
}
