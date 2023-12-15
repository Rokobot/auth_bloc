import 'package:auth_page/Bloc/bloc/auth_bloc.dart';
import 'package:auth_page/Const/const.dart';
import 'package:auth_page/Const/widgets.dart';
import 'package:auth_page/screens/auth_screen/login_page.dart';
import 'package:auth_page/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is authLoaded) {
              return signupWidget(context);
            }
            if (state is authLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }
            if (state is errorState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showSnackBar(context, state.error);
              });
            }
            if (state is authsucces) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                replaceNextPage(context, HomePage());
              });
            }
            return signupWidget(context);
          },
        ),
      ),
    );
  }

  Widget signupWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign up',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: TextFieldBorder(hintText: 'username'),
              controller: usernameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: TextFieldBorder(hintText: 'email'),
              controller: emailController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: TextFieldBorder(hintText: 'password'),
              controller: passwordController,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            color: Colors.green,
            onPressed: () {
              context.read<AuthBloc>().add(getSignup(
                  username: usernameController.text,
                  email: emailController.text,
                  password: passwordController.text));
            },
            child: Text('sign up'),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              replaceNextPage(context, loginPage());
            },
            child: Text('you have already an account?'),
          )
        ],
      ),
    );
  }
}
