import 'package:flutter/material.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';

import 'Style/Constant.dart';

// Anshu

class Gbooked extends StatefulWidget {
  const Gbooked({Key? key}) : super(key: key);

  @override
  State<Gbooked> createState() => _GbookedState();
}

var a = Ridetimeg.toString().split("0");

class _GbookedState extends State<Gbooked> {
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
    // await Future.delayed();

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
          title: Text("Your Gbooked Ride"),
        ),
        body: Container(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            // Center(
            //   child: Text(
            //     "Congratulations",
            //     style: TextStyle(
            //       fontSize: 34,
            //       color: Color.fromARGB(255, 0, 0, 0),
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
            // Center(
            //     child: Text(
            //   "On booking a ride",
            //   style: TextStyle(
            //     fontSize: 20,
            //     color: Color.fromARGB(255, 9, 5, 229),
            //   ),
            // )),

            // Row(children: [
            //   Text("Your ride details",
            //       style: TextStyle(
            //           fontSize: 25, color: Color.fromARGB(255, 9, 9, 12)))
            // ]),

            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.person, size: 45),
                    title: Text(
                        "MR. ${gridedetails['userFirstname']} ${gridedetails['userLastname']}"),
                    subtitle: Text('Ride Partner'),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.location_city, size: 45),
                    title: Text('${plocg}'),
                    subtitle: Text('Pickup Point'),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.location_city_outlined, size: 45),
                    title: Text('${dlocg}'),
                    subtitle: Text('Drop Point'),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.time_to_leave, size: 45),
                    title: Text('${Ridetimeg}'),
                    subtitle: Text('Pickup Time'),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.timelapse, size: 45),
                    title: Text('9:15 AM'),
                    subtitle: Text('Esitimated Drop Time'),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.currency_rupee, size: 45),
                    title: Text('50 Rupee'),
                    subtitle: Text('To pay'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    _fetchData(context);
                  },
                  child: Text(
                    'Call',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      // side: BorderSide(color: skygreen_24d39e, width: 0),
                    ),
                  )),
            )
          ]),
        ));
  }
}
