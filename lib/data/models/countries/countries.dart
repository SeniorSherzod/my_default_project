class CountryModel {
  // final String commonName;
  final String officialName;
  // final Map<String, dynamic> nativeNames;
  // final List<String> topLevelDomain;
  // final String alpha2Code;
  // final String alpha3Code;
  // final String cioc;
  // final bool independent;
  // final String status;
  // final bool unMember;
  // final Map<String, dynamic> currencies;
  // final Map<String, dynamic> idd;
  // final List<String> capital;
  // final List<String> altSpellings;
  final String region;

  // final String subregion;
  final Map<String, dynamic> languages;
  // final Map<String, dynamic> translations;
  // final List<double> latlng;
  // final bool landlocked;
  // final int area;
  // final Map<String, dynamic> demonyms;
  final String flag;
  // final Map<String, dynamic> maps;
  final int population;
  // final Map<String, dynamic> gini;
  // final String fifa;
  // final Map<String, dynamic> car;
  // final List<String> timezones;
  // final List<String> continents;
  final Map<String, dynamic> flags;
  // final Map<String, dynamic> coatOfArms;
  // final String startOfWeek;
  // final Map<String, dynamic> capitalInfo;
  // final Map<String, dynamic> postalCode;

  CountryModel({
    // required this.commonName,
    required this.officialName,
    // required this.nativeNames,
    // required this.topLevelDomain,
    // required this.alpha2Code,
    // required this.alpha3Code,
    // required this.cioc,
    // required this.independent,
    // required this.status,
    // required this.unMember,
    // required this.currencies,
    // required this.idd,
    // required this.capital,
    // required this.altSpellings,
    required this.region,
    // required this.subregion,
    required this.languages,
    // required this.translations,
    // required this.latlng,
    // required this.landlocked,
    // required this.area,
    // required this.demonyms,
    required this.flag,
    // required this.maps,
    required this.population,
    // required this.gini,
    // required this.fifa,
    // required this.car,
    // required this.timezones,
    // required this.continents,
    required this.flags,
    // required this.coatOfArms,
    // required this.startOfWeek,
    // required this.capitalInfo,
    // required this.postalCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      // commonName: json['name']['common'] as String? ?? "",
      officialName: json['name']['official'] as String? ?? "",
      // nativeNames: json['name']['nativeName'] as Map<String, dynamic>? ?? {},
      // topLevelDomain: (json['tld'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      // alpha2Code: json['cca2'] as String? ?? "",
      // alpha3Code: json['cca3'] as String? ?? "",
      // cioc: json['cioc'] as String? ?? "",
      // independent: json['independent'] as bool? ?? false,
      // status: json['status'] as String? ?? "",
      // unMember: json['unMember'] as bool? ?? false,
      // currencies: json['currencies'] as Map<String, dynamic>? ?? {},
      // idd: json['idd'] as Map<String, dynamic>? ?? {},
      // capital: (json['capital'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      // altSpellings: (json['altSpellings'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      region: json['region'] as String? ?? "",
      // subregion: json['subregion'] as String? ?? "",
      languages: json['languages'] as Map<String, dynamic>? ?? {},
      // translations: json['translations'] as Map<String, dynamic>? ?? {},
      // latlng: (json['latlng'] as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList() ?? [],
      // landlocked: json['landlocked'] as bool? ?? false,
      // area: json['area'] as int? ?? 0,
      // demonyms: json['demonyms'] as Map<String, dynamic>? ?? {},
      flag: json['flag'] as String? ?? "",
      // maps: json['maps'] as Map<String, dynamic>? ?? {},
      population: json['population'] as int? ?? 0,
      // gini: json['gini'] as Map<String, dynamic>? ?? {},
      // fifa: json['fifa'] as String? ?? "",
      // car: json['car'] as Map<String, dynamic>? ?? {},
      // timezones: (json['timezones'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      // continents: (json['continents'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      flags: json['flags'] as Map<String, dynamic>? ?? {},
      // coatOfArms: json['coatOfArms'] as Map<String, dynamic>? ?? {},
      // startOfWeek: json['startOfWeek'] as String? ?? "",
      // capitalInfo: json['capitalInfo'] as Map<String, dynamic>? ?? {},
      // postalCode: json['postalCode'] as Map<String, dynamic>? ?? {},
    );
  }

// Map<String, dynamic> toJson() {
//   return {
//     'name': {'common': commonName, 'official': officialName, 'nativeName': nativeNames},
//     'tld': topLevelDomain,
//     'cca2': alpha2Code,
//     'cca3': alpha3Code,
//     'cioc': cioc,
//     'independent': independent,
//     'status': status,
//     'unMember': unMember,
//     'currencies': currencies,
//     'idd': idd,
//     'capital': capital,
//     'altSpellings': altSpellings,
//     'region': region,
//     'subregion': subregion,
//     'languages': languages,
//     'translations': translations,
//     'latlng': latlng,
//     'landlocked': landlocked,
//     'area': area,
//     'demonyms': demonyms,
//     'flag': flag,
//     'maps': maps,
//     'population': population,
//     'gini': gini,
//     'fifa': fifa,
//     'car': car,
//     'timezones': timezones,
//     'continents': continents,
//     'flags': flags,
//     'coatOfArms': coatOfArms,
//     'startOfWeek': startOfWeek,
//     'capitalInfo': capitalInfo,
//     'postalCode': postalCode,
//   };
// }
}
