sealed class CountriesEvent {}

class FetchCountries extends CountriesEvent{
}
class FetchCountriesByContinent extends CountriesEvent {
  final String continentCode;

  FetchCountriesByContinent(this.continentCode);
}
