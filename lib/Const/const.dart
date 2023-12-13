import 'package:auth_page/auth_screen/login_page.dart';
import 'package:flutter/material.dart';

showSnackBar(context, error) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(error)));
}

nextPage(context, name) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => name));
}

replaceNextPage(context, name) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => name));
}
