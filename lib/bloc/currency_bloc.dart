import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_update/currency_model.dart';
import 'package:local_update/local_database.dart';
import 'package:local_update/network_reponce.dart';
import 'package:local_update/update_database.dart';
import 'package:my_default_project/bloc/currency_state.dart';
import 'package:my_default_project/data/models/network_responce.dart';
import '../data/network/api_provider.dart';
import 'currency_event.dart';

class CurrencyBloc extends Bloc<CurrencyEventBloc, CurrencyStateBloc> {
  CurrencyBloc() : super(CurrencyInitialStateBloc()) {
    on<GetCurrencyEvent>(_getCurrencies);
  }

  static List<CurrencyModel> localCurrencies = [];
  static bool updateData = true;

  Future<void> _getCurrencies(GetCurrencyEvent event, Emitter<CurrencyStateBloc> emit) async {
    await _getLocalData();
    emit(CurrencyLoadingStateBloc());
    NetworkResponse networkResponse = await ApiProvider.getCurrencies();
    if (networkResponse.errorText.isEmpty) {
      emit(CurrencySuccessStateBloc(currencies: networkResponse.data as List<CurrencyModel>));
    }
    await _changeData();
  }

  Future<void> _getLocalData() async {
    NetworkResponse networkResponse = (await LocalDatabase.getAllCurrencies()) as NetworkResponse;
    if (networkResponse.errorText.isEmpty) {
      localCurrencies = networkResponse.data;
    }
  }

  Future<void> _changeData() async {
    await _getLocalData();
    if (localCurrencies.isEmpty) {
      localCurrencies = (state is CurrencySuccessStateBloc) ? (state as CurrencySuccessStateBloc).currencies : [];
      for (CurrencyModel currencyModel in localCurrencies) {
        await LocalDatabase.insertCurrency(currencyModel);
      }
    } else if (state is CurrencySuccessStateBloc && (state as CurrencySuccessStateBloc).currencies.isNotEmpty && updateData) {
      for (CurrencyModel currencyModelLocal in localCurrencies) {
        for (CurrencyModel currencyModel in (state as CurrencySuccessStateBloc).currencies) {
          if (currencyModelLocal.spotTheDifference(currencyModel: currencyModel)) {
            await updateLocalDB(currencyModel);
            break;
          }
        }
      }
      updateData = false;
    }
    emit(CurrencySuccessStateBloc(currencies: localCurrencies));
  }

  Future<void> errorConnectInternet() async {
    if (localCurrencies.isEmpty) {
      NetworkResponse networkResponse = (await LocalDatabase.getAllCurrencies()) as NetworkResponse;
      emit(CurrencySuccessStateBloc(currencies: networkResponse.data));
    } else {
      emit(CurrencySuccessStateBloc(currencies: localCurrencies));
    }
  }
}