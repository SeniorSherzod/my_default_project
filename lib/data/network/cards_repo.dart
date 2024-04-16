import '../models/card_model.dart';
import '../models/network_responce.dart';
import 'api_provider.dart';

class CardsRepository {
  CardsRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<NetworkResponse> getCards() => apiProvider.getCards();

  Future<NetworkResponse> updateCards(CardModel cardModel) => apiProvider.updateCard(cardModel);
  Future<NetworkResponse> addCards(CardModel cardModel) => apiProvider.addCard(cardModel);
}
