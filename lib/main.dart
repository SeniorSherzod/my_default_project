import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/bloc/quiz_bloc.dart';
import 'package:my_default_project/bloc/quiz_event.dart';
import 'package:my_default_project/screens/pin_put_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WordGuessBloc()..add(LoadQuestionEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Guess the Word',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GuessWordInput(), // Access QuizBloc through context
      ),
    );
  }
}
