

import 'package:local_update/currency_model.dart';

abstract class CurrencyStateBloc {}

class CurrencyInitialStateBloc extends CurrencyStateBloc {}

class CurrencyLoadingStateBloc extends CurrencyStateBloc {}

class CurrencySuccessStateBloc extends CurrencyStateBloc {
  CurrencySuccessStateBloc({required this.currencies});

  final List<CurrencyModel> currencies;
}

class CurrencyErrorStateBloc extends CurrencyStateBloc {
  CurrencyErrorStateBloc({required this.errorText});

  final String errorText;
}