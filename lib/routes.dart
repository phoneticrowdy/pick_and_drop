import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_and_drop/HOME.dart';
import 'package:pick_and_drop/contactus.dart';
import 'package:pick_and_drop/ridedetais.dart';
import 'package:pick_and_drop/rides.dart';
import 'package:pick_and_drop/login.dart';
import 'package:pick_and_drop/signup.dart';
import 'package:pick_and_drop/take%20ride.dart';
import 'package:pick_and_drop/wait.dart';
import 'package:pick_and_drop/walkthrough.dart';

import 'booked.dart';
import 'give ride.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/login':
      {
        return MaterialPageRoute(builder: (context) => login());
      }
    case '/wait':
      {
        return MaterialPageRoute(builder: (context) => wait());
      }
    case '/listview':
      {
        return MaterialPageRoute(builder: (context) => Rides());
      }
    case '/signup':
      {
        return MaterialPageRoute(builder: (context) => const SignupPage());
      }
    case '/Home':
      {
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      }
    case '/Takeride':
      {
        return MaterialPageRoute(builder: (context) => const Takeride());
      }
    case '/Giveride':
      {
        return MaterialPageRoute(builder: (context) => const Giveride());
      }
    case '/Contactus':
      {
        return MaterialPageRoute(builder: (context) => Contactus());
      }
    case '/ridedetails':
      {
        return MaterialPageRoute(builder: (context) => Ridedetails());
      }
    case '/booked':
      {
        return MaterialPageRoute(builder: (context) => Booked());
      }
    case '/walk':
      {
        return MaterialPageRoute(builder: (context) => WalkthroughPager());
      }
    default:
      {
        return MaterialPageRoute(builder: (context) => const Rides());
      }
  }
}
