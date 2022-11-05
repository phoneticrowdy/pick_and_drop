import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_and_drop/HOME.dart';
import 'package:pick_and_drop/contactus.dart';
import 'package:pick_and_drop/deafult.dart';
import 'package:pick_and_drop/login.dart';
import 'package:pick_and_drop/signup.dart';
import 'package:pick_and_drop/take%20ride.dart';

import 'give ride.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/login':
      {
        return MaterialPageRoute(builder: (context) => login());
      }
    case '/signup':
      {
        return MaterialPageRoute(builder: (context) => const SignupPage());
      }
    case '/Home':
      {
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      }
    case '/Takeride':{
      return MaterialPageRoute(builder: (context) => const Takeride());
    }  
     case '/Giveride':{
      return MaterialPageRoute(builder: (context) => const Giveride());
    }  
    case '/Contactus':{
      return MaterialPageRoute(builder: (context) => Contactus());
    }  
    default:{
      return MaterialPageRoute(builder: (context) => const defaultpage());
}
    }
  }
  
