import 'package:flutter/material.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';

// Anshu

class Rides extends StatefulWidget {
  const Rides({Key? key}) : super(key: key);

  @override
  State<Rides> createState() => _RidesState();
}

class _RidesState extends State<Rides> {
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
          title: Text("Rides Page"),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, i) => Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          // highlightColor: Colors.red,
                          //splashColor: Colors.blueAccent,

                          // onTap: () {
                          //   setState(() {
                          //     sampleData.forEach(
                          //         (element) => element.selected = false);
                          //     sampleData[i].selected = true;
                          //   });
                          // },
                          child: Card(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'assets/images/$i.jfif',
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ListTile(
                                    title: Text(
                                        'Anshu Singh                         Padari - khajanchi'),
                                    subtitle: Text('9:15AM-10:55AM'),
                                    // trailing: Icon(Icons.more_vert),
                                    isThreeLine: true,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/ridedetails');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                )));
  }
}
