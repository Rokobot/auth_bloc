import 'package:auth_page/Bloc/bloc/auth_bloc.dart';
import 'package:auth_page/Const/const.dart';
import 'package:auth_page/Const/widgets.dart';
import 'package:auth_page/screens/auth_screen/sign_page.dart';
import 'package:auth_page/screens/home_page.dart';
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
            if (state is authLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }

            if (state is authsucces) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showSnackBar(context, 'succes');
                replaceNextPage(context, HomePage());
              });
              return LoginPage(context);
            }
            if (state is errorState) {
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
        Text(
          'Login',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: emailController,
            decoration: TextFieldBorder(hintText: 'email'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: passwordController,
              decoration: TextFieldBorder(hintText: 'password')),
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
        SizedBox(
          height: 30,
        ),
        GestureDetector(
          child: Text('dont have an account?'),
          onTap: () {
            nextPage(context, signupPage());
          },
        )
      ],
    );
  }
}
