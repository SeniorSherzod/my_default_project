import 'package:flutter/material.dart';
import 'package:my_default_project/screens/demo_screens/demo_screens.dart';
import 'package:my_default_project/screens/second_task_screen/second_task_scree.dart';
import 'package:my_default_project/screens/store_screen/store_screen.dart';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: FirstScreen(),
    ),
  );
}