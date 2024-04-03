import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/data/repository/incomes_repository.dart';
import 'package:my_default_project/screens/demo_screens/demo_screens.dart';
import 'package:my_default_project/screens/timer_screen/select_screen.dart';

import '../data/cubits/incomes/incomes_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => IncomeRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => IncomeCubit(
                incomeRepository: context.read<IncomeRepository>())
              ..fetchIncome(),
          ),
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
      theme: ThemeData(useMaterial3: false),
      home: const IncomeScreen(),
    );
  }
}
