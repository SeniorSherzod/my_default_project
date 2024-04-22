import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/bloc/quiz_event.dart';
import 'package:my_default_project/bloc/quiz_state.dart';
import '../screens/guess_screens/word_controller.dart'; // Import your WordGuessQuestion and questions here

class WordGuessBloc extends Bloc<GuessWordEvent, GuessWordState> {
  WordGuessBloc() : super(GuessWordInitial()) {
    on<LoadQuestionEvent>(_mapLoadQuestionToState);
    on<AddLetterEvent>(_mapAddLetterToState);
    on<RemoveLetterEvent>(_mapRemoveLetterToState);
    on<SubmitAnswerEvent>(_mapSubmitAnswerToState);
  }

  void _mapLoadQuestionToState(LoadQuestionEvent event, Emitter<GuessWordState> emit) {
    emit(
      QuestionLoaded(
        questions: questions,
        targetWord: questions[event.index].answer.toLowerCase(),
        enteredWord: "",
        attempts: 10,
        currentIndex: event.index,
      ),
    );
  }

  void _mapAddLetterToState(AddLetterEvent event, Emitter<GuessWordState> emit) {
    if (state is QuestionLoaded) {
      final currentState = state as QuestionLoaded;
      final newEnteredWord = currentState.enteredWord + event.letter;
      emit(currentState.copyWith(enteredWord: newEnteredWord));
    }
  }

  void _mapRemoveLetterToState(RemoveLetterEvent event, Emitter<GuessWordState> emit) {
    if (state is QuestionLoaded) {
      final currentState = state as QuestionLoaded;
      if (currentState.enteredWord.isNotEmpty) {
        final newEnteredWord = currentState.enteredWord.substring(0, currentState.enteredWord.length - 1);
        emit(currentState.copyWith(enteredWord: newEnteredWord));
      }
    }
  }

  void _mapSubmitAnswerToState(SubmitAnswerEvent event, Emitter<GuessWordState> emit) {
    if (state is QuestionLoaded) {
      final currentState = state as QuestionLoaded;
      final isCorrect = currentState.enteredWord.toLowerCase() == currentState.targetWord;
      if (!isCorrect) {
        emit(currentState.copyWith(attempts: currentState.attempts - 1));
      } else {
        emit(AnswerCorrect());
      }
    }
  }
}
