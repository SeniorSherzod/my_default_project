import 'package:equatable/equatable.dart';

abstract class GuessWordEvent extends Equatable {
  const GuessWordEvent();

  @override
  List<Object?> get props => [];
}

class LoadQuestionEvent extends GuessWordEvent {
  List<Object?> get props => [];
}

class AddLetterEvent extends GuessWordEvent {
  final String letter;

  const AddLetterEvent(this.letter);

  @override
  List<Object?> get props => [letter];
}

class RemoveLetterEvent extends GuessWordEvent {}

class SubmitAnswerEvent extends GuessWordEvent {}
