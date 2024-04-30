import 'package:local_update/currency_model.dart';

import '../../models/currency_mode.dart';

abstract class CurrencyStateMulti {}

class CurrencyInitialState extends CurrencyStateMulti {}

class CurrencyLoadingState extends CurrencyStateMulti {}

class CurrencySuccessState extends CurrencyStateMulti {
  CurrencySuccessState({required this.currencies});

  final List<CurrencyModel> currencies;
}

class CurrencyErrorState extends CurrencyStateMulti {
  CurrencyErrorState({required this.errorText});

  final String errorText;
}