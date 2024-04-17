import 'package:flutter/material.dart';

import '../../../data/models/country_model.dart';

class CountrySearchDelegate extends SearchDelegate<String> {
  final List<CountryModel> countries;

  CountrySearchDelegate(this.countries);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = countries.where((country) => country.name.toLowerCase().contains(query.toLowerCase())).toList();
    return _buildSearchResults(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = countries.where((country) => country.name.toLowerCase().contains(query.toLowerCase())).toList();
    return _buildSearchResults(context, results);
  }

  Widget _buildSearchResults(BuildContext context, List<CountryModel> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].name),
          trailing: Text(results[index].emoji),
          subtitle: Text(results[index].continentName),
          onTap: () {
            close(context, results[index].name);
          },
        );
      },
    );
  }

  @override
  String get searchFieldLabel => 'Search Country';
}