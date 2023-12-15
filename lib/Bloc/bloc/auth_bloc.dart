import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<getLogin>((event, emit) async {
      emit(authLoaded());
      SharedPreferences sf = await SharedPreferences.getInstance();
      if ((event.email == sf.getString('username') ||
          event.password == sf.getString('password'))) {
        emit(authLoading());
        Future.delayed(Duration(seconds: 1));
        emit(authsucces());
      } else {
        (emit(errorState(error: 'username or password is wrong')));
      }
    });

    on<getSignup>((event, emit) async {
      emit(authLoaded());
      if (!(event.username.toString() == '' ||
          event.email.toString() == '' ||
          event.password.toString() == '')) {
        emit(authLoading());
        Future.delayed(Duration(seconds: 1));
        await Future(() async {
          SharedPreferences sf = await SharedPreferences.getInstance();
          sf.setString('username', event.username.toString());
          sf.setString('email', event.email.toString());
          sf.setString('password', event.password.toString());
        }).whenComplete(() => (emit(authsucces())));
      } else {
        (emit(errorState(error: 'check your information again')));
      }
    });
  }
}
