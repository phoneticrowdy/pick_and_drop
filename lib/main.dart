import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pick_and_drop/Style/Constant.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/deafult.dart';
import 'package:pick_and_drop/login.dart';
import 'package:pick_and_drop/routes.dart';
import 'HOME.dart';
import 'database.dart';

void main() async {
  var database = LocalDatabase();
  // await database.create_a_table(profileTable);
 userDetails=await database.getData();
 Name_user=await  userDetails[0]["userFirstname"]+" "+userDetails[0]["userLastname"];
 
 datalen= userDetails.length;
//  await datalen!=0?Name_user=userDetails[0]["userFirstname"]:
//  print(datalen);
  
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode (SystemUiMode.manual, overlays: []);
    
    return MaterialApp(
      title: 'Pick & drop',
      home: datalen== 0 ? const login() : const MyHomePage(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: '/',
      theme: ThemeData(
        backgroundColor: bg_456999,
        primarySwatch: primaryBlack,
        
      ),
      // home:MyHomePage(),
    );
  }
}
