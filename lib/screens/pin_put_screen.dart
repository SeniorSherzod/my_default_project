import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/bloc/quiz_bloc.dart';
import 'package:my_default_project/bloc/quiz_event.dart';
import 'package:my_default_project/bloc/quiz_state.dart';
import 'package:my_default_project/screens/guess_screens/word_controller.dart';

// class WordGuessScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Guess the Word'),
//       ),
//       body: BlocProvider(
//         create: (context) => WordGuessBloc().add(LoadQuestionEvent()),
//         // Provide your WordGuessBloc instance here
//         child: GuessWordInput(),
//       ),
//     );
//   }
// }

class GuessWordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordGuessBloc, GuessWordState>(
      builder: (context, state) {
        if (state is QuestionLoaded) {
          return Column(
            children: [
              Text(state.questions.length.toString()),
              SizedBox(height: 20),
              Text('Attempts left: ${state.attempts}'),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  // Dispatch AddLetterEvent with the entered letter
                  context.read<WordGuessBloc>().add(AddLetterEvent(value));
                },
                decoration: InputDecoration(
                  hintText: 'Enter a letter',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Dispatch SubmitAnswerEvent
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
