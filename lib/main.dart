import 'package:flutter/material.dart';
import 'package:my_default_project/screens/home_screens/home_screens.dart';
import 'package:my_default_project/screens/home_screens/smiles_type.dart';
import 'package:my_default_project/screens/home_screens/snow_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: HomeScreen(),
      // onGenerateRoute: MyRouter.generateRoute,
      // initialRoute: homeRoute,
    );
  }
}