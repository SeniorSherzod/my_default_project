import 'package:flutter/material.dart';

import '../data/models/card_model.dart';

abstract class CardsEvent {}

class GetCardsEvent extends CardsEvent {}

class DeleteCardEvent extends CardsEvent {
  final CardModel card;

  DeleteCardEvent(this.card);
}

class InitiateTransferEvent extends CardsEvent {
  final CardModel fromCard;
  final CardModel toCard;
  final double transferAmount;
  final BuildContext context;

  InitiateTransferEvent({
    required this.fromCard,
    required this.toCard,
    required this.transferAmount,
    required this.context,
  });
}

class GetCardByIdEvent extends CardsEvent {
  final int cardId;

  GetCardByIdEvent(this.cardId);
}
class UpdateCardEvent extends CardsEvent {
  final CardModel updatedCard;

  UpdateCardEvent(this.updatedCard);
}class AddCardEvent extends CardsEvent {
  final CardModel addCard;

  AddCardEvent(this.addCard);
}
