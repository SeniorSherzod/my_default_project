import 'package:flutter/material.dart';
import 'package:my_default_project/screens/calculator_screens/calculator_screens.dart';
import 'package:my_default_project/view_model/calculator_view_model/calculator_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: CalculatorView(),
      // onGenerateRoute: MyRouter.generateRoute,
      // initialRoute: homeRoute,
    );
  }
}
