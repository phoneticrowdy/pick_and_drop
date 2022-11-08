import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Contactus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: ContactUs(
          companyName: "Pick & Drop",
          textColor: Colors.black,
          companyColor: Colors.white10,
          cardColor: Colors.white,
          taglineColor: Colors.amber,
          logo: AssetImage('images/crop.jpg'),
          email: 'prasenjeetsingh10@gmail.com',
          phoneNumber: '+918933089770',
          dividerThickness: 2,
          website: 'phoneticrowdy',
          linkedinURL: 'https://www.linkedin.com/in/prasenjeet-singh-4b2361236',
          tagLine: 'Service On The Way',
          twitterHandle: 'Prasenjeet Singh',
        ),
      ),
    );
  }
}
