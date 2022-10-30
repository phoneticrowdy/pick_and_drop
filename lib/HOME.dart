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
        backgroundColor: bg_456999,
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                color: Colors.black,
              ),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera,
                color: Colors.black,
              ),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Colors.black,
              ),
              label: 'Chats',
            ),
          ],
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
                        onTap: () {
                          Navigator.pushNamed(context, '/Giveride');
                        },
                      )),
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
                              // str_setup,
                              "Take a ride",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: sfpro_text_semibold),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/Takeride');
                        },
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 18.3, top: 32.3),
                      child: InkWell(
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
                              "Contact Us",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: sfpro_text_semibold),
                            ),
                          ],
                        ),
                        onTap: (){Navigator.pushNamed(context, '/Contactus');},
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
                        margin:
                            EdgeInsets.only(left: 22, right: 22, bottom: 25),
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
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: Color.fromARGB(255, 229, 200, 200)),
              height: 200,
              width: double.infinity,
              // color: const Color.fromARGB(255, 231, 226, 214),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: const Center(child: Text("hey there")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        color: Color.fromARGB(255, 229, 200, 200)),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                        child: Text("Hello",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 116, 175, 147)))),
                    width: 80,
                    height: 80,
                  ),
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => const page2()));
                  },
                ),
                SizedBox(
                  width: 80,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        color: Color.fromARGB(255, 229, 200, 200)),
                    child: Center(
                        child: Text("hello",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 173, 205, 190)))),
                    width: 80,
                    height: 80,
                  ),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const page2()),
                    // );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          color: Color.fromARGB(255, 229, 200, 200)),
                      child: Center(
                          child: Text("hello",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 110, 157, 144)))),
                      width: 80,
                      height: 80,
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const page2()));
                    }),
                SizedBox(
                  width: 80,
                ),
                InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                          color: Color.fromARGB(255, 229, 200, 200)),
                      child: Center(
                          child: Text("hello",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 237, 239, 238)))),
                      width: 80,
                      height: 80,
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const page2()));
                    }),
              ],
            ),
          ]),
        ));
  }
}
