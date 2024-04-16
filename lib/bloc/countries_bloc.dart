import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/country_model.dart';
import '../data/network/api_provider.dart';
import 'countries_state.dart';
import 'country_event.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc({required this.apiClient}) : super(CountriesInitial()) {
    on<FetchCountries>(
          (FetchCountries event, emit) async {
        emit(CountriesLoading());
        try {
          final networkResponse = await apiClient.getCountries();
          if (networkResponse.data != null) {
            final countries = networkResponse.data as List<CountryModel>;
            emit(CountriesSuccess(countries));
          } else {
            emit(CountriesError(networkResponse.errorText));
          }
        } on Exception catch (error) {
          // Handle unexpected errors gracefully (e.g., logging)
          emit(CountriesError(error.toString()));
        }
      },
    );

    // Handle FetchCountriesByContinent event (assuming it exists)
    on<FetchCountriesByContinent>(
          (FetchCountriesByContinent event, emit) async {
        emit(CountriesLoading());
        try {
          final networkResponse = await apiClient.getCountriesByContinent(
              event.continentCode); // Assuming apiClient has this method
          if (networkResponse.errorText.isEmpty) {
            final countries = networkResponse.data as List<CountryModel>;
            emit(CountriesSuccess(countries));
          } else {
            emit(CountriesError(networkResponse.errorText));
          }
        } on Exception catch (error) {
          // Handle unexpected errors gracefully
          emit(CountriesError(error.toString()));
        }
      },
    );
  }

  final ApiClient apiClient;
}
