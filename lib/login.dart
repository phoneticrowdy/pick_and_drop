import 'package:flutter/material.dart';
import 'package:pick_and_drop/HOME.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/Style/my_icons.dart';
import 'package:pick_and_drop/routes.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Anshu@123'),
              ),
            ),
            SizedBox(
              height: 10
            ),
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyHomePage()));
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
            )
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}
