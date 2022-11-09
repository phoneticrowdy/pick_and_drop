import 'package:flutter/material.dart';
import 'package:pick_and_drop/Apis.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';

import 'Style/Constant.dart';

// Anshu

class wait extends StatefulWidget {
  const wait({Key? key}) : super(key: key);

  @override
  State<wait> createState() => _waitState();
}

class _waitState extends State<wait> {
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
    await Future.delayed(gid(context, giveId));

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
          title: Text("wait Page"),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                _fetchData(context);
              },
              child: Text(
                'Search for Partner',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal.shade700,
                onPrimary: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  // side: BorderSide(color: skygreen_24d39e, width: 0),
                ),
              )),
        ));
  }
}
