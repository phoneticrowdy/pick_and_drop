import 'package:flutter/material.dart';
import 'package:pick_and_drop/Apis.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';

// Anshu Shailesh singh

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var userloginreaction;
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
    await Future.delayed(
        userLogin(context, nameController.text, passwordController.text));

    // Close the dialog programmatically
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Center(
                child: Container(
                    // width: 200, height: 150,
                    child: Image.asset(img_pager)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Anshu@123'),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              child: Container(
                  child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              )),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    _fetchData(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: pink_ff5465,
                    onPrimary: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      // side: BorderSide(color: skygreen_24d39e, width: 0),
                    ),
                  )),
            ),
            SizedBox(
              height: 120,
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New User ?    "),
                InkWell(
                  child: Text(
                    'Create an Account',
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
