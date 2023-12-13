import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<getLogin>((event, emit) async {
      emit(authLoaded());
      if (!(event.email == '' || event.password == '')) {
        emit(authLoading());
        await Future.delayed(Duration(seconds: 1));
        emit(authsucces());
      } else {
        emit(authError(error: 'username or password is wrong'));
      }
    });
    on<getSignup>((event, state) {
      emit(authLoaded());
    });
  }
}
