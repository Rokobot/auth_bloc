part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class authLoading extends AuthState {}

class authLoaded extends AuthState {}

class authsucces extends AuthState {}

class errorState extends AuthState {
  String? error;
  errorState({required this.error});
}
