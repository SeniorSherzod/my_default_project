import 'package:my_default_project/data/models/countries_model.dart';

import '../../models/form_status.dart';

class CountryState {
  final FormsStatus formsStatus;
  final List<CountryModel> countries;
  final String statusText;

  CountryState({
    required this.formsStatus,
    required this.statusText,
    required this.countries,
  });

  CountryState copyWith({
    FormsStatus? formsStatus,
    List<CountryModel>? countries,
    String? statusText,
  }) =>
      CountryState(
        formsStatus: formsStatus ?? this.formsStatus,
        countries: countries ?? this.countries,
        statusText: statusText ?? this.statusText,
      );
}