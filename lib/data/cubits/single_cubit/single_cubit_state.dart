import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/data/cubits/single_cubit/single_currency_cunit.dart';
import '../../models/currency_mode.dart';
import '../../models/form_status.dart';
import '../../models/network_responce.dart';
import '../../network/api_provider.dart';
class CurrenciesCubit extends Cubit<CurrencyState> {
  CurrenciesCubit()
      : super(
    CurrencyState(
      formsStatus: FormsStatus.pure,
      statusText: "",
      currencies: [],
    ),
  ) {
    //fetchCurrencies();
  }

  fetchCurrencies() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse response = await ApiProvider.getCurrencies();
    if (response.errorText.isEmpty) {
      emit(
        state.copyWith(
          currencies: response.data as List<CurrencyModel>,
          formsStatus: FormsStatus.success,
        ),
      );
    } else {
      emit(state.copyWith(
        statusText: response.errorText,
        formsStatus: FormsStatus.error,
      ));
    }
  }
}