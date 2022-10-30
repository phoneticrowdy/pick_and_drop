import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:pick_and_drop/main.dart';



class Contactus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: ContactUs(
          companyName:"Pick & Drop",
          textColor:Colors.black,
 companyColor:Colors.white10,
 cardColor: Colors.white,
   taglineColor:Colors.amber,

          logo: AssetImage('images/crop.jpg'),
          email: 'adoshi26.ad@gmail.com',
          
          phoneNumber: '+91123456789',
          dividerThickness: 2,
          website: 'https://abhishekdoshi.godaddysites.com',
          githubUserName: 'AbhishekDoshi26',
          linkedinURL: 'https://www.linkedin.com/in/abhishek-doshi-520983199/',
          tagLine: 'Flutter Developer',
          twitterHandle: 'AbhishekDoshi26',
        ),
      ),
    );
  }
}
