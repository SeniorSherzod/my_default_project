import 'package:flutter/material.dart';
import 'package:my_default_project/screens/demo_screens/demo_screens.dart';
import 'package:my_default_project/utils/view_models/location_view_model.dart';
import 'package:my_default_project/utils/view_models/maps_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LocationViewModel()),
      ChangeNotifierProvider(create: (_) => MapsViewModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: HomeScreens(),
    );
  }
}