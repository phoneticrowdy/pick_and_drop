import 'package:flutter/material.dart';
import 'package:pick_and_drop/Style/my_colors.dart';
import 'package:pick_and_drop/routes.dart';
import 'HOME.dart';
// phoneticrodwy
// hello

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: primaryBlack,
      ),
      home: const MyHomePage(),
    );
  }
}
