import 'package:flutter/material.dart';
import '../data/models/file_data_model.dart';

class BookSearchDelegate extends SearchDelegate<String> {
  final List<FileDataModel> allBooks;

  BookSearchDelegate({required this.allBooks});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredResults = allBooks.where((book) => book.fileName.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: filteredResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredResults[index].fileName),
          onTap: () {
            close(context, filteredResults[index].fileName);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredSuggestions = allBooks.where((book) => book.fileName.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredSuggestions[index].fileName),
          onTap: () {
            query = filteredSuggestions[index].fileName;
            showResults(context);
          },
        );
      },
    );
  }
}
