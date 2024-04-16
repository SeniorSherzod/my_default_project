const String countriesQuery = '''query {
  countries {
    code
    name
    capital
    emoji
    phone
    continent{
      name
    }
  }
}''';

String getCountryQueryByContinent(String query) {
  return '''query CountriesByContinent {
  countries(filter: { continent: { in: ["$query"] } }) {
    code
    name
    capital
    emoji
    phone
    continent{
      name
    }
  }
}''';
}
