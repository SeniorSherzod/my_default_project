class CountryModel {
  final String code;
  final String name;
  final String phone;
  final Continent continent;
  final String capital;
  final String currency;
  final String emoji;

  CountryModel({
    required this.code,
    required this.name,
    required this.phone,
    required this.continent,
    required this.capital,
    required this.currency,
    required this.emoji,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'] as String? ?? "",
      name: json['name'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      continent: Continent.fromJson(json['continent']),
      capital: json['capital'] as String? ?? "",
      currency: json['currency'] as String? ?? "",
      emoji: json['emoji'] as String? ?? "",
    );
  }
}

class Continent {
  final String code;
  final String name;

  Continent({
    required this.code,
    required this.name,
  });

  factory Continent.fromJson(Map<String, dynamic> json) {
    return Continent(
      code: json['code'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );
  }
}
