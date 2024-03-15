import '../models/countries/countries.dart';
import '../network/network_model.dart';

class CountryRepository{
  final NetworkModel networkModel;
  CountryRepository({required this.networkModel});
  Future<List<CountryModel>> getCountries() async => networkModel.getCountries();
}