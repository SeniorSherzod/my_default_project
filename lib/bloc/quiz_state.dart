import 'package:equatable/equatable.dart';
import '../screens/guess_screens/word_controller.dart';

class GuessWordState extends Equatable {
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
  final int currentIndex; // Add currentIndex property

  const QuestionLoaded({
    required this.questions,
    required this.targetWord,
    required this.enteredWord,
    required this.attempts,
    required this.currentIndex, // Initialize currentIndex in the constructor
  });

  @override
  List<Object?> get props => [questions, targetWord, enteredWord, attempts, currentIndex];

  QuestionLoaded copyWith({
    List<WordGuessQuestion>? questions,
    String? targetWord,
    String? enteredWord,
    int? attempts,
    int? currentIndex,
  }) {
    return QuestionLoaded(
      questions: questions ?? this.questions,
      targetWord: targetWord ?? this.targetWord,
      enteredWord: enteredWord ?? this.enteredWord,
      attempts: attempts ?? this.attempts,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class AnswerCorrect extends GuessWordState {}
