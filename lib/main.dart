import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/data/cubits/countries/countries_cubit.dart';
import 'package:my_default_project/screens/demo_screens/demo_screens.dart';
import 'package:my_default_project/screens/security_screen/password_screen.dart';

import 'data/cubits/digits/digits_button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CountriesCubit()..fetchCountries()),
        // BlocProvider(create: (_) => PasswordCubit()),
        // BlocProvider(create: (_) => PinCubit()..D()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: SecurityScreen(),
    );
  }
}