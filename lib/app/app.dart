import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_default_project/screens/splash_screens/splash_screens.dart';
import 'package:my_default_project/bloc/note_bloc.dart';
import '../bloc/note_event.dart';
import '../data/local/local_storage.dart';
import '../screens/home_screen/home_screen.dart'; // Import your NoteBloc
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => LocalDatabase.instance), // Provide LocalDatabase
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => NoteBloc(localDatabase: context.read<LocalDatabase>()) // Provide NoteBloc with LocalDatabase
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
      home: BlocProvider(
        create: (context) => NoteBloc(localDatabase: context.read<LocalDatabase>()),
        child: SplashScreen(),
      ),
      routes: {
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

