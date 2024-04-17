import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/screens/demo_screens/widgets/search_delegate.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

import '../../bloc/countries_bloc.dart';
import '../../bloc/countries_state.dart';
import '../../bloc/country_event.dart';
import '../../data/models/country_model.dart';
import '../../utils/colors/app_colors.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("COUNTRIES"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (selectedOption) {
              if (selectedOption == 'All') {
                context.read<CountriesBloc>().add(FetchCountries());
              }
              else if (selectedOption.length == 2) {
                context.read<CountriesBloc>().add(
                  FetchCountriesByContinent(selectedOption.toUpperCase()),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'All',
                child: Text('All Countries'),
              ),
              // Add continent options with valid codes
              const PopupMenuItem<String>(
                value: 'EU',
                child: Text('Europe'),
              ),
              const PopupMenuItem<String>(
                value: 'NA',
                child: Text('North America'),
              ),
              const PopupMenuItem<String>(
                value: 'SA',
                child: Text('South America'),
              ),
              const PopupMenuItem<String>(
                value: 'AF',
                child: Text('Africa'),
              ),
              const PopupMenuItem<String>(
                value: 'AS',
                child: Text('Asia'),
              ),
              const PopupMenuItem<String>(
                value: 'OC',
                child: Text('Oceania'),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CountrySearchDelegate(context.read<CountriesBloc>().state.countries),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<CountriesBloc, CountriesState>(
            builder: (context, state) {
              if (state is CountriesLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CountriesError) {
                return Center(child: Text(state.errorMessage));
              }

              if (state is CountriesSuccess) {
                return _buildCountriesList(context, state.countries);
              }

              return const SizedBox();
            },
          ),
          
        ],
      ),
    );
  }

  Widget _buildCountriesList(BuildContext context, List<CountryModel> countries) {
    if (countries.isEmpty) {
      return const Center(child: Text('No countries found')); // Or display a placeholder message
    }
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading:Text("+${countries[index].phone}",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25,fontWeight: FontWeight.w200),),
          title: Text(countries[index].name),
          trailing: Text(countries[index].emoji,style: AppTextStyle.GilroyMedium.copyWith(fontSize: 30),),
          subtitle: Text(countries[index].continentName),
        );
      },
    );
  }
}
