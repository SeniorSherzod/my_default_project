import 'package:flutter_test/flutter_test.dart';
import 'package:my_default_project/bloc/quiz_bloc.dart';
import 'package:my_default_project/bloc/quiz_event.dart';
import 'package:my_default_project/bloc/quiz_state.dart';

void main() {
  group('WordGuessBloc', () {
    late WordGuessBloc wordGuessBloc;

    setUp(() {
      wordGuessBloc = WordGuessBloc();
    });

    test('Initial state is QuestionLoaded with correct initial data', () {
      expect(
        wordGuessBloc.state,
        isA<QuestionLoaded>().having(
              (state) => state.targetWord,
          'targetWord',
          '',
        ).having(
              (state) => state.enteredWord,
          'enteredWord',
          '',
        ).having(
              (state) => state.attempts,
          'attempts',
          0,
        ),
      );
    });

    test('AddLetterEvent updates enteredWord correctly', () {
      final initialState = QuestionLoaded(
        questions: [],
        targetWord: "piano",
        enteredWord: "",
        attempts: 0,
      );
      final expectedState = initialState.copyWith(enteredWord: "a");

      wordGuessBloc.emit(initialState);
      wordGuessBloc.add(AddLetterEvent("a"));

      expect(wordGuessBloc.state, expectedState);
    });

    test('RemoveLetterEvent removes last letter from enteredWord', () {
      final initialState = QuestionLoaded(
        questions: [],
        targetWord: "piano",
        enteredWord: "p",
        attempts: 0,
      );
      final expectedState = initialState.copyWith(enteredWord: "");

      wordGuessBloc.emit(initialState);
      wordGuessBloc.add(RemoveLetterEvent());

      expect(wordGuessBloc.state, expectedState);
    });

    test('SubmitAnswerEvent checks correctness and updates attempts', () {
      final initialState = QuestionLoaded(
        questions: [],
        targetWord: "piano",
        enteredWord: "pi",
        attempts: 10,
      );
      final incorrectAnswerState = initialState.copyWith(attempts: 9);
      final correctAnswerState = AnswerCorrect();

      wordGuessBloc.emit(initialState);
      wordGuessBloc.add(SubmitAnswerEvent());

      expect(wordGuessBloc.state, incorrectAnswerState);

      wordGuessBloc.emit(initialState.copyWith(enteredWord: "piano"));
      wordGuessBloc.add(SubmitAnswerEvent());

      expect(wordGuessBloc.state, correctAnswerState);
    });
  });
}
