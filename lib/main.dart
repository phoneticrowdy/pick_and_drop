import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/routes.dart';
import 'HOME.dart';
import 'database.dart';
// phoneticrodwy
// hello
//hey there`
// bs

void main() async {
  var database = LocalDatabase();
  // await database.create_a_table(profileTable);
  
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
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: '/',
      theme: ThemeData(
        backgroundColor: bg_456999,
        primarySwatch: primaryBlack,
      ),
      home: const MyHomePage(),
    );
  }
}
