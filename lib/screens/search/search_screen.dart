import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/bloc/note_bloc.dart';
import 'package:my_default_project/bloc/note_state.dart';
import 'package:my_default_project/data/models/note_model.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';

import '../../bloc/note_event.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        // leading: IconButton(
        //   icon:const Icon(Icons.bac),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) =>
        //            const HomeScreen(),
        //       ),
        //     );
        //   },
        // ),
        title:const Text('Search Results'),
        actions: [
          IconButton(
            icon:const Icon(Icons.clear),
            onPressed: () {
              searchController.clear();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: searchController,
              onChanged: (query) {
                BlocProvider.of<NoteBloc>(context).add(SearchNote(noteText: query));
              },
              style:const TextStyle(color: Colors.white),
              decoration:const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NoteSearchState) {
            if (state.searchResults.isEmpty) {
              return const Center(child: Text('No results found.'));
            } else {
              return ListView.builder(
                itemCount: state.searchResults.length,
                itemBuilder: (context, index) {
                  final NoteModel note = state.searchResults[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(note.noteColor)
                      ),
                      child: ListTile(
                        title: Text(note.noteText),
                        subtitle: Text(note.createdDate.toString()),

                      ),
                    ),
                  );
                },
              );
            }
          } else if (state is NoteErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Search state is not handled.'));
          }
        },
      ),
    );
  }
}

