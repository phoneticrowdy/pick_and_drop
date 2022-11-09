import 'package:flutter/material.dart';
import 'package:pick_and_drop/Apis.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';

import 'Style/Constant.dart';

// Anshu

class Ridedetails extends StatefulWidget {
  const Ridedetails({Key? key}) : super(key: key);

  @override
  State<Ridedetails> createState() => _RidedetailsState();
}

class _RidedetailsState extends State<Ridedetails> {
  void _fetchData(BuildContext context) async {
    // show the loading dialog
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ),
          );
        });

    // Your asynchronous computation here (fetching data from an API, processing files, inserting something to the database, etc)
    await Future.delayed(book(context, takeId, GlobaluserId));

    // Close the dialog programmatically
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: pink_ff5465,
        toolbarHeight: 100,
        title: Text("Ridedetails Page"),
      ),
      body: Container(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: Column(children: [
              Text(
                "Mr.${ride[flag]['vehicalMode']}",
                style: TextStyle(
                  fontSize: 34,
                  color: Color.fromARGB(255, 194, 63, 63),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                child: Image.asset(
                  'assets/images/1.jfif',
                ),
              ),
              Row(
                children: [
                  Container(
                      child: Column(
                    children: [
                      Text(
                        "${ride[flag]['startingLocationId']}",
                        style: TextStyle(
                          // fontSize: ,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${ride[flag]['RideTime']}",
                        style: TextStyle(
                          // fontSize: 20,
                          color: Colors.black,
                        ),
                      )
                    ],
                  )),
                  Container(
                    width: 200,
                    child: Text(
                        "<----------------------------------------------->"),
                  ),
                  Container(
                      child: Column(
                    children: [
                      Text(
                        "${ride[flag]['destinationLocationId']}",
                        style: TextStyle(
                            // fontSize: 20,
                            color: Colors.black),
                      ),
                      Text("10:00 AM",
                          style: TextStyle(
                              // fontSize: 20,
                              color: Colors.black))
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Text(
                "Mobile No :- ${ride[flag]['vehicalNumber']}",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 219, 42, 10),
                  fontWeight: FontWeight.w400,
                ),
              )),
              SizedBox(
                height: 5,
              ),
              Container(
                  child: Text(
                "Cost:- 50 Rupee",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 225, 11, 11),
                  fontWeight: FontWeight.w400,
                ),
              )),
              SizedBox(
                height: 30,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      takeId = ride[flag]['userId'];
                      _fetchData(context);
                    },
                    child: Text(
                      'Book',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      elevation: 0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        // side: BorderSide(color: skygreen_24d39e, width: 0),
                      ),
                    )),
              )
            ]),
          ),
          height: 450,
          width: 400,
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(border: Border.all(color: pink_ff5465))),
    );
  }
}
