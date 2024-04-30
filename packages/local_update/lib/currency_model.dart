class CurrencyModel {
  final String code;
  final String currencyCode;
  final String cyNmUZ;
  final String cyNmEN;
  final String nominal;
  final String rate;
  final String date;

  CurrencyModel({
    required this.code,
    required this.currencyCode,
    required this.cyNmUZ,
    required this.cyNmEN,
    required this.nominal,
    required this.rate,
    required this.date,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      code: json["Code"] as String? ?? "",
      currencyCode: json["Ccy"] as String? ?? "",
      cyNmUZ: json["CcyNm_UZ"] as String? ?? "",
      cyNmEN: json["CcyNm_EN"] as String? ?? "",
      nominal: json["Nominal"] as String? ?? "",
      rate: json["Rate"] as String? ?? "",
      date: json["Date"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Code': code,
      'Ccy': currencyCode,
      'CcyNm_UZ': cyNmUZ,
      'CcyNm_EN': cyNmEN,
      'Nominal': nominal,
      'Rate': rate,
      'Date': date,
    };
  }

  CurrencyModel copyWith({
    String? code,
    String? currencyCode,
    String? cyNmUZ,
    String? cyNmEN,
    String? nominal,
    String? rate,
    String? date,
  }) {
    return CurrencyModel(
      code: code ?? this.code,
      currencyCode: currencyCode ?? this.currencyCode,
      cyNmUZ: cyNmUZ ?? this.cyNmUZ,
      cyNmEN: cyNmEN ?? this.cyNmEN,
      nominal: nominal ?? this.nominal,
      rate: rate ?? this.rate,
      date: date ?? this.date,
    );
  }
  bool spotTheDifference({required CurrencyModel currencyModel}) {
    return code != currencyModel.code ||
        currencyCode != currencyModel.currencyCode ||
        cyNmUZ != currencyModel.cyNmUZ ||
        cyNmEN != currencyModel.cyNmEN ||
        nominal != currencyModel.nominal ||
        rate != currencyModel.rate ||
        date != currencyModel.date;
  }
}
