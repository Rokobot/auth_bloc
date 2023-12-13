import 'package:auth_page/Bloc/bloc/auth_bloc.dart';
import 'package:auth_page/Const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            print(state);
            if (state is AuthInitial) {
              return LoginPage(context);
            }
            if (state is loginLoaded) {
              return LoginPage(context);
            }
            if (state is loginLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }

            if (state is loginsucces) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showSnackBar(context, 'succes');
              });
              return LoginPage(context);
            }
            if (state is loginError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showSnackBar(context, state.error.toString());
              });
              return LoginPage(context);
            }

            return LoginPage(context);
          },
        ),
      ),
    );
  }

  Column LoginPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Login'),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 200,
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'email'),
          ),
        ),
        Container(
          width: 200,
          child: TextField(
            controller: passwordController,
            decoration: InputDecoration(hintText: 'password'),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        MaterialButton(
          color: Colors.green,
          onPressed: () {
            context.read<AuthBloc>().add(getLogin(
                email: emailController.text,
                password: passwordController.text));
          },
          child: Text('login'),
        ),
      ],
    );
  }
}
