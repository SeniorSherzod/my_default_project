import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_update/currency_model.dart';
import 'package:local_update/network_reponce.dart';

import '../../models/currency_mode.dart';
import '../../models/network_responce.dart';
import '../../repository/currency_repo.dart';
import 'currency_multistate.dart';

class CurrencyCubitMulti extends Cubit<CurrencyStateMulti> {
  CurrencyCubitMulti({required this.currencyRepository})
      : super(CurrencyInitialState());

  final CurrencyRepository currencyRepository;

  Future<void> fetchCurrencies() async {
    emit(CurrencyLoadingState());
    NetworkResponse response = await currencyRepository.getCurrencies();
    if (response.errorText.isEmpty) {
      emit(CurrencySuccessState(
          currencies: response.data as List<CurrencyModel>));
    } else {
      emit(CurrencyErrorState(errorText: response.errorText));
    }
  }
}