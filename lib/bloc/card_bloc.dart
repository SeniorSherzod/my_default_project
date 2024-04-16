import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/card_model.dart';
import '../data/network/cards_repo.dart';
import 'card_event.dart';
import 'card_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc({required this.cardsRepository}) : super(CardInitialState()) {
    on<GetCardsEvent>(_getCards);
    on<UpdateCardEvent>(_updateCard);
    on<AddCardEvent>(_addCard);
  }

  final CardsRepository cardsRepository;

  Future<void> _getCards(GetCardsEvent event, Emitter<CardsState> emit) async {
    emit(CardLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    var response = await cardsRepository.getCards();
    if (response.errorText.isNotEmpty) {
      emit(CardsErrorState(response.errorText));
    } else {
      emit(CardSuccessState(cards: response.data as List<CardModel>));
    }
  }

  Future<void> _updateCard(UpdateCardEvent event, Emitter<CardsState> emit) async {
    emit(CardLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    var response = await cardsRepository.updateCards(event.updatedCard);
    if (response.errorText.isNotEmpty) {
      emit(CardsErrorState(response.errorText));
    } else {
      // If the update was successful, reload the card list
      add(GetCardsEvent());
    }
  }
  Future<void> _addCard(AddCardEvent event, Emitter<CardsState> emit) async {
    emit(CardLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    var response = await cardsRepository.addCards(event.addCard);
    if (response.errorText.isNotEmpty) {
      emit(CardsErrorState(response.errorText));
    } else {
      // If the addition was successful, reload the card list
      add(GetCardsEvent());
    }
  }
}
