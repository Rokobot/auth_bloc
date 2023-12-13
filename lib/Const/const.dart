import 'package:flutter/material.dart';

showSnackBar(context, error) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(error)));
}
