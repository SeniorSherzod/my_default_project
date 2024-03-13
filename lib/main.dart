import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/fifth_screen.dart';
import 'package:my_default_project/screens/animation_screens/first_screen.dart';
import 'package:my_default_project/screens/animation_screens/flutter_logoblack.dart';
import 'package:my_default_project/screens/animation_screens/four_circlecolor_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // onGenerateRoute: MyRouter.generateRoute,
      home:FirstScreen(),
    );
  }
}