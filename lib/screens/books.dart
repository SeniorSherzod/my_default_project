import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/file_manager_bloc.dart';
import '../data/models/file_data_model.dart';
import 'books_search.dart';

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              final FileManagerState state = context.read<FileManagerBloc>().state;
              showSearch(context: context, delegate: BookSearchDelegate(allBooks: state.books));
            },
          ),
        ],
      ),
      body: BlocBuilder<FileManagerBloc, FileManagerState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCategoryDropdown(context),
              Expanded(
                child: state.books.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : _buildCarouselSlider(state.books),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCategoryDropdown(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<FileManagerBloc, FileManagerState>(
        builder: (context, state) {
          return DropdownButton<String>(
            value: 'All',
            items: ['All', 'Science', 'Poem', 'Roman', 'Action', 'Qissa', 'Tarix']
                .map<DropdownMenuItem<String>>(
                  (genre) => DropdownMenuItem<String>(
                value: genre,
                child: Text(genre),
              ),
            )
                .toList(),
            onChanged: (String? selectedGenre) {
              if (selectedGenre != null) {
                context.read<FileManagerBloc>().add(CategoryBooksEvent(genre: selectedGenre));
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildCarouselSlider(List<FileDataModel> books) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 500.0,
        enlargeCenterPage: true,
      ),
      items: books.map((book) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                // Handle book tap
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      book.iconPath,
                      height: 300,
                      width: 350,
                    ),
                    Text(book.fileName),
                    SizedBox(height: 10),
                    Text(book.bookGenre),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
