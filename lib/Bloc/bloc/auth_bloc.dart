import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<getLogin>((event, emit) async {
      emit(loginLoaded());
      if (!(event.email == '' || event.password == '')) {
        emit(loginLoading());
        await Future.delayed(Duration(seconds: 1));
        emit(loginsucces());
      } else {
        emit(loginError(error: 'username or password is wrong'));
      }
    });
  }
}
