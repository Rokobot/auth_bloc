import 'package:auth_page/Bloc/bloc/auth_bloc.dart';
import 'package:auth_page/Const/const.dart';
import 'package:auth_page/auth_screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign up'),
              GestureDetector(
                onTap: () {
                  replaceNextPage(context, loginPage());
                },
                child: Text('you have already an account?'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
