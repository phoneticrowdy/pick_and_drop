import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pick_and_drop/Style/Constant.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';
import 'package:pick_and_drop/Style/my_strings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
          backgroundColor: btn_black_0b0b0b,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 22.7, left: 20.7),
                    child: SvgPicture.asset(
                      icon_back,
                      height: 15,
                      width: 21.3,
                      color: Colors.white,
                    )),
                Container(
                  margin: EdgeInsets.only(left: 18.3, top: 22.3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: gray_e2e2e2,
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            img_congrates,
                            width: 65,
                            height: 65,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 19,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mr. Anshu Singh",
                            style: TextStyle(
                                fontSize: 18.3,
                                color: Colors.white,
                                fontFamily: sfpro_text_semibold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                img_star,
                                height: 18,
                                width: 18,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                str_rating,
                                style: TextStyle(
                                    fontSize: 13.3,
                                    color: Colors.white,
                                    fontFamily: sfpro_text_semibold),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                      margin: EdgeInsets.only(left: 18.3, top: 32.3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            setting,
                            height: 22,
                            color: Colors.white,
                            width: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Signup",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: sfpro_text_semibold),
                          ),
                        ],
                      )),
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
                Container(
                    margin: EdgeInsets.only(left: 18.3, top: 32.3),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            setting,
                            height: 22,
                            color: Colors.white,
                            width: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: sfpro_text_semibold),
                          ),
                        ],
                      ),
                      onTap: () {
                        print("login ivoked");
                        Navigator.pushNamed(context, '/login');
                        print("login seerved");
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(left: 18.3, top: 37.7),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            qr_code,
                            color: Colors.white,
                            height: 22,
                            width: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            // str_my_qr_code,
                            "Give a Ride",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: sfpro_text_semibold),
                          ),
                        ],
                      ),
                      onTap: () {},
                    )),
                Container(
                    margin: EdgeInsets.only(left: 18.3, top: 32.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          setting,
                          height: 22,
                          color: Colors.white,
                          width: 22,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          // str_setup,
                          "Take a ride",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: sfpro_text_semibold),
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(left: 18.3, top: 32.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          call,
                          height: 22,
                          width: 22,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          str_call_transport,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: sfpro_text_semibold),
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(left: 18.3, top: 32.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          logout,
                          height: 22,
                          color: Colors.white,
                          width: 22,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          str_logout,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: sfpro_text_semibold),
                        ),
                      ],
                    )),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(left: 22, right: 22, bottom: 25),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            child: Text(
                              str_emergency_button,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: sfpro_text_medium),
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: pink_ff5465,
                              onPrimary: Colors.white,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                // side: BorderSide(color: skygreen_24d39e, width: 0),
                              ),
                            )),
                      ),
                    ),
                  ),
                )
              ])),
      body: Center(
          child: Column(children: [
        ElevatedButton(
            child: Text(
              "Take a ride",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: sfpro_text_medium),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: pink_ff5465,
              onPrimary: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                // side: BorderSide(color: skygreen_24d39e, width: 0),
              ),
            )),
        ElevatedButton(
            child: Text(
              "Give a Ride",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: sfpro_text_medium),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: pink_ff5465,
              onPrimary: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                // side: BorderSide(color: skygreen_24d39e, width: 0),
              ),
            ))
      ])),
    );
  }
}
