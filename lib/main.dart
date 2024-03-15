import 'package:flutter/material.dart';
import 'package:my_default_project/data/repository/users_repository.dart';
import 'package:my_default_project/screens/countries/counties_screen.dart';
import 'package:my_default_project/view_model/view_model_countries/countries_model.dart';
import 'package:my_default_project/view_model/view_user_model/user_model_view.dart';
import 'package:provider/provider.dart';
import 'package:my_default_project/data/network/network_model.dart';
import 'package:my_default_project/data/repository/countries_repository.dart';
import 'package:my_default_project/screens/demo_screens/demo_screens.dart';

void main() {
  NetworkModel networkModel = NetworkModel();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersViewModel(
            usersRepository: UsersRepository(networkModel: networkModel),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CountriesViewModel(
            countryRepository: CountryRepository(networkModel: networkModel),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: CountriesScreen(),
      // onGenerateRoute: MyRouter.generateRoute,
      // initialRoute: homeRoute,
    );
  }
}
