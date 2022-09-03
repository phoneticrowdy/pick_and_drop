import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_and_drop/HOME.dart';
import 'package:pick_and_drop/login.dart';
import 'package:pick_and_drop/signup.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/login':
      {
        return MaterialPageRoute(builder: (context) => login());
      }
    case '/signup':
      {
        return MaterialPageRoute(builder: (context) => SignupPage());
      }
    case '/Home':
      {
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      }
    default:
  }
  return MaterialPageRoute(builder: (context) => MyHomePage());
}
