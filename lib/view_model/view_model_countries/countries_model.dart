import 'package:flutter/cupertino.dart';
import 'package:my_default_project/data/repository/countries_repository.dart';

import '../../../data/models/countries/countries.dart';

class CountriesViewModel extends ChangeNotifier{
  CountriesViewModel ({
    required this.countryRepository,
}){
    fetchCountries();
  }
  final CountryRepository countryRepository;

  bool isLoading = false;
  List<CountryModel> countries =[];

  fetchCountries()async{
    isLoading=true;
    notifyListeners();
   var country= await countryRepository.getCountries();
   isLoading=false;
   notifyListeners();
   if(country.isEmpty){

   }else{
     countries=country;
     notifyListeners();
   }
  }
}
