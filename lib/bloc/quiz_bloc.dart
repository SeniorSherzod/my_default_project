import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/bloc/quiz_event.dart';
import 'package:my_default_project/bloc/quiz_state.dart';
import 'package:my_default_project/screens/guess_screens/word_controller.dart';

class WordGuessBloc extends Bloc<GuessWordEvent, GuessWordState> {
  WordGuessBloc()
      : super(QuestionLoaded(
          questions: questions,
          targetWord: "",
          enteredWord: "",
          attempts: 0,
        )) {
    // on<LoadQuestionEvent>(_mapLoadQuestionToState
    //     as EventHandler<LoadQuestionEvent, GuessWordState>);
    on<LoadQuestionEvent>(questions as EventHandler<LoadQuestionEvent, GuessWordState>);
    on<AddLetterEvent>(_mapAddLetterToState);
    on<RemoveLetterEvent>(_mapRemoveLetterToState);
    on<SubmitAnswerEvent>(_mapSubmitAnswerToState);
  }

  // _mapLoadQuestionToState(
  //     LoadQuestionEvent event) async* {
  //   yield QuestionLoaded(
  //     question: question.question,
  //     imageUrls: question.imageUrls,
  //     targetWord: question.answer.toLowerCase(),
  //     attempts: 10,
  //     enteredWord: '',
  //   );
  // }

  // onInit(LoadQuestionEvent event, emit) {
  //   String answerText = questions[state.]
  //
  //   emit(
  //     state.copyWith(
  //       allQuestions: questions,
  //       letterList: getOptionLetters(answerText),
  //     ),
  //   );
  // }

  _mapAddLetterToState(
      AddLetterEvent event, Emitter<GuessWordState> emit) async* {
    if (state is QuestionLoaded) {
      final currentState = state as QuestionLoaded;
      final newEnteredWord = currentState.enteredWord + event.letter;
      if (newEnteredWord.length <= currentState.targetWord.length) {
        emit(currentState.copyWith(enteredWord: newEnteredWord));
      }
    }
  }

  _mapRemoveLetterToState(
      RemoveLetterEvent event, Emitter<GuessWordState> emit) async* {
    if (state is QuestionLoaded) {
      final currentState = state as QuestionLoaded;
      if (currentState.enteredWord.isNotEmpty) {
        final newEnteredWord = currentState.enteredWord
            .substring(0, currentState.enteredWord.length - 1);
        emit(currentState.copyWith(enteredWord: newEnteredWord));
      }
    }
  }

  _mapSubmitAnswerToState(
      SubmitAnswerEvent event, Emitter<GuessWordState> emit) async* {
    if (state is QuestionLoaded) {
      final currentState = state as QuestionLoaded;
      final isCorrect =
          currentState.enteredWord.toLowerCase() == currentState.targetWord;
      if (!isCorrect) {
        emit(currentState.copyWith(attempts: currentState.attempts - 1));
      } else {
        emit(AnswerCorrect());
      }
    }
  }
}
