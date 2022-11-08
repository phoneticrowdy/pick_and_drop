import 'package:flutter/material.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';

import 'listmodel.dart';

// Anshu

class defaultpage extends StatefulWidget {
  const defaultpage({Key? key}) : super(key: key);

  @override
  State<defaultpage> createState() => _defaultpageState();
}

class _defaultpageState extends State<defaultpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var userdefaultpagereaction;
  var _isLoading = false;

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
        title: Text("defaultpage Page"),
      ),
      body: Column(children: [
        for (int i = 0; i <= 4; i++)
          Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    'assets/images/thar-exterior-right-front-three-quarter-11.jpg',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ListTile(
                    title: Text(
                        'Anshu Singh                          Padari - khajanchi'),
                    subtitle: Text('9:15AM-10:55AM'),
                    // trailing: Icon(Icons.more_vert),
                    isThreeLine: true,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
      ]),
    );
  }
}
