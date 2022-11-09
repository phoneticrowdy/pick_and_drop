import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pick_and_drop/Apis.dart';
import 'package:pick_and_drop/Style/Constant.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';
import 'package:pick_and_drop/Style/my_strings.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: pink_ff5465,
        toolbarHeight: 100,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: Material(
        child: Row(
          children: [
            InkWell(
              child: Container(
                color: Colors.teal.shade700,
                child: Center(
                    child: Text("Take Ride",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white))),
                height: kToolbarHeight,
                width: 200,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Takeride');
              },
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              child: Container(
                color: Colors.teal.shade700,
                child: Center(
                  child: Text("Give Ride",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                height: kToolbarHeight,
                width: 200,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Giveride');
              },
            )
          ],
        ),
      ),
      drawer: Drawer(
          backgroundColor: Colors.white,
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
                      color: Colors.teal.shade700,
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
                            Name_user,
                            style: TextStyle(
                                fontSize: 18.3,
                                color: Colors.teal.shade700,
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
                                color: Colors.amberAccent,
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
                            color: Colors.black,
                            width: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "ride View",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: sfpro_text_semibold),
                          ),
                        ],
                      )),
                  onTap: () {
                    Navigator.pushNamed(context, '/walk');
                  },
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
                            color: Colors.black,
                            width: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "wait",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: sfpro_text_semibold),
                          ),
                        ],
                      )),
                  onTap: () {
                    Navigator.pushNamed(context, '/wait');
                  },
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
                            color: Colors.black,
                            width: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "List View",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: sfpro_text_semibold),
                          ),
                        ],
                      )),
                  onTap: () {
                    Navigator.pushNamed(context, '/listview');
                  },
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
                            color: Colors.black,
                            width: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Signup",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
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
                            color: Colors.black,
                            width: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
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
                    margin: EdgeInsets.only(left: 18.3, top: 32.3),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            call,
                            height: 22,
                            width: 22,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Contact Us",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: sfpro_text_semibold),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/Contactus');
                      },
                    )),
                Container(
                    margin: EdgeInsets.only(left: 18.3, top: 32.3),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            logout,
                            height: 22,
                            color: Colors.black,
                            width: 22,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            str_logout,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontFamily: sfpro_text_semibold),
                          ),
                        ],
                      ),
                      onTap: () {
                        var database = LocalDatabase();
                        database.deleteData();
                        initState() {}
                        ;
                        Navigator.pushNamed(context, '/login');
                      },
                    )),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 22, right: 22, bottom: 25),
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
                              primary: Colors.teal.shade700,
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
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1667848006694-5f032afe4e47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1667848006694-5f032afe4e47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1667848006694-5f032afe4e47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1667848006694-5f032afe4e47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1667848006694-5f032afe4e47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
