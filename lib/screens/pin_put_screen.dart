import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/quiz_bloc.dart';
import '../bloc/quiz_event.dart';
import '../bloc/quiz_state.dart';

class WordGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Game'),
      ),
      body: BlocProvider(
        create: (_) => WordGuessBloc()..add(LoadQuestionEvent(1)),
        child: WordGameContent(),
      ),
    );
  }
}

class WordGameContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordGuessBloc, GuessWordState>(
      builder: (context, state) {
        if (state is QuestionLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Question: ${state.questions[state.currentIndex].question}'),
              SizedBox(height: 20),
              Text('Attempts left: ${state.attempts}'),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  context.read<WordGuessBloc>().add(AddLetterEvent(value));
                },
                decoration: InputDecoration(
                  hintText: 'Enter a letter',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<WordGuessBloc>().add(SubmitAnswerEvent());
                },
                child: Text('Submit'),
              ),
            ],
          );
        } else if (state is AnswerCorrect) {
          return Center(
            child: Text('Congratulations! You guessed it right!'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
