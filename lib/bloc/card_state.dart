import '../data/models/card_model.dart';
abstract class CardsState {}

class CardInitialState extends CardsState {}

class CardLoadingState extends CardsState {}

class CardSuccessState extends CardsState {
  CardSuccessState({required this.cards});

  final List<CardModel> cards;
}

class CardsErrorState extends CardsState {
  final String errorText;

  CardsErrorState(this.errorText);
}

class CardDeletedState extends CardsState {}
class CardUpdateState extends CardsState {}

class InsufficientFundsState extends CardsState {}
