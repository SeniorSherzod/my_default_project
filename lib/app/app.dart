import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/data/cubits/multistate_cubit/currency_multi_cubit.dart';
import 'package:my_default_project/data/cubits/single_cubit/single_cubit_state.dart';
import 'package:my_default_project/screens/singlecubit_currency_screens/currency_screens.dart';

import '../bloc/connectivity/connectivity_bloc.dart';
import '../bloc/connectivity/connectivity_event.dart';
import '../bloc/currency_bloc.dart';
import '../bloc/currency_event.dart';
import '../data/repository/currency_repo.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => CurrencyRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) =>
          CurrenciesCubit()
            ..fetchCurrencies()),
          BlocProvider(
            create: (context) => CurrencyCubitMulti(
                currencyRepository: context.read<CurrencyRepository>())
              ..fetchCurrencies(),
          ),
          BlocProvider(
            create: (_) => CurrencyBloc()..add(GetCurrencyEvent()),
          ),
          BlocProvider(
              create: (_) => ConnectivityBloc()..add(CheckConnectivity())),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false,appBarTheme: AppBarTheme(backgroundColor: Colors.amber)),
      home: const CurrenciesScreen(),
    );
  }
}
