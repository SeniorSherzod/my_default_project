
import 'package:equatable/equatable.dart';
import 'package:my_default_project/screens/guess_screens/word_controller.dart';

abstract class GuessWordState extends Equatable {
  const GuessWordState();

  @override
  List<Object?> get props => [];
}

class GuessWordInitial extends GuessWordState {}

class QuestionLoaded extends GuessWordState {
  final List<WordGuessQuestion> questions;
  final String targetWord;
  final String enteredWord;
  final int attempts;

  const QuestionLoaded({
    required this.questions,
    required this.targetWord,
    required this.enteredWord,
    required this.attempts,
  });

  @override
  List<Object?> get props => [questions, targetWord, enteredWord, attempts];

  QuestionLoaded copyWith({
    List<WordGuessQuestion>? questions,
    String? targetWord,
    String? enteredWord,
    int? attempts,
  }) {
    return QuestionLoaded(
      questions: questions ?? this.questions,
      targetWord: targetWord ?? this.targetWord,
      enteredWord: enteredWord ?? this.enteredWord,
      attempts: attempts ?? this.attempts,
    );
  }
}

class AnswerCorrect extends GuessWordState {}
