import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pick_and_drop/Style/Constant.dart';

import 'Style/my_colors.dart';
import 'Style/my_icons.dart';

class wait extends StatefulWidget {
  const wait({Key? key}) : super(key: key);

  @override
  _waitState createState() => _waitState();
}

class _waitState extends State<wait> {
  @override
  final List<PageViewModel> pages = [
    /*--- First Page ---*/
    PageViewModel(
      title: 'Waiting for the partner',
      body:
          'We have recieved you ride details and we will find you a ride partner as soon as possibe',
      footer: Text("Estimated Time 5 min"),
      image: Center(
        child: Image.asset(
          img_congrates,
          height: 250,
        ),
      ),
      decoration: PageDecoration(
          bodyTextStyle: TextStyle(
              fontSize: 15, fontFamily: sfpro_text_regular, color: gray_868590),
          titleTextStyle: TextStyle(
              fontSize: 20, fontFamily: sfpro_text_bold, color: black_163351)),
    ),
    /*--- Second Page ---*/
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: statusbar_f8f8f8, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: IntroductionScreen(
            pages: pages,
            dotsDecorator: getDotDecoration(),
            // dotsDecorator: const DotsDecorator(
            //   size: Size(10, 10),
            //   color: Colors.red,
            //   activeSize: Size(22,10),
            //   activeColor: Colors.blue,
            //   // activeShape: RoundedRectangleBorder(
            //   //   borderRadius: BorderRadius.only(topRight: 5,topLeft:10,bottomLeft: 5,bottomRight: 5)
            //   // ),
            // ),
            showDoneButton: true,
            done: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 33),
                decoration: BoxDecoration(
                    color: pink_ff5465,
                    borderRadius: new BorderRadius.circular(8)),
                child: const Text(
                  "Done",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: sfpro_text_bold,
                      color: Colors.white),
                )),
            // showSkipButton: true,
            // skip: const Text("Skip"),
            showNextButton: true,
            next: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                decoration: BoxDecoration(
                    color: pink_ff5465,
                    borderRadius: new BorderRadius.circular(8)),
                child: const Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: sfpro_text_bold,
                      color: Colors.white),
                )),
            onDone: () => onDone(context),
            curve: Curves.bounceOut,
          ),
        ),
      ),
    );
  }

  void onDone(context) {
    Navigator.pushNamed(context, '/login');
  }

  getDotDecoration() => DotsDecorator(
      color: gray_9d9d9d,
      activeColor: pink_ff5465,
      size: Size(11, 11),
      activeSize: Size(30, 11),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)));
}
