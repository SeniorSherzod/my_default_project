
import 'package:equatable/equatable.dart';

class GuessWordEvent extends Equatable {
  const GuessWordEvent();

  @override
  List<Object?> get props => [];
}

class LoadQuestionEvent extends GuessWordEvent {
  final int index;

  LoadQuestionEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class AddLetterEvent extends GuessWordEvent {
  final String letter;

  const AddLetterEvent(this.letter);

  @override
  List<Object?> get props => [letter];
}

class RemoveLetterEvent extends GuessWordEvent {}

class SubmitAnswerEvent extends GuessWordEvent {}