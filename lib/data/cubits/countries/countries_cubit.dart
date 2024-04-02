import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/data/cubits/countries/countries_state.dart';
import 'package:my_default_project/data/models/countries_model.dart';
import '../../models/form_status.dart';
import '../../models/network_responce.dart';
import '../../network/api_provider.dart';

class CountriesCubit extends Cubit<CountryState> {
  CountriesCubit()
      : super(
    CountryState(
      formsStatus: FormsStatus.pure,
      statusText: "",
      countries: [],
    ),
  ) {
    //fetchCurrencies();
  }

  fetchCountries() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse response = await ApiProvider.getCountries();
    if (response.errorText.isEmpty) {
      emit(
        state.copyWith(
          countries: response.data as List<CountryModel>,
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