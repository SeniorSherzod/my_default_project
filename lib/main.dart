import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_default_project/screens/pin_put_screen.dart';

void main() {
  runApp(GuessWordGame());
}

class GuessWordGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guess the Word',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Puzzlegame(),
    );
  }
}