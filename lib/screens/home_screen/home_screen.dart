import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:my_default_project/bloc/note_bloc.dart';
import 'package:my_default_project/bloc/note_event.dart';
import 'package:my_default_project/bloc/note_state.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:my_default_project/data/models/note_model.dart';
import '../editor_screen/editor_screen.dart';
import '../sample_screen/sample_screen.dart';
import '../search/search_screen.dart'; // Import the AddScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title:const Text('Notes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              // Navigate to the search screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),

        ],
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NoteLoadedState) {
            if (state.notes.isEmpty) {
              return Center(
                child: Lottie.asset(AppImages.empty),
              );
            } else {
              return ListView.builder(
                itemCount: state.notes.length,
                itemBuilder: (context, index) {
                  final NoteModel note = state.notes[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Dismissible(
                      key: Key(note.id.toString()),
                      onDismissed: (direction) {
                        // Implement logic to delete note here
                        BlocProvider.of<NoteBloc>(context)
                            .add((DeleteNote(id: note.id!)));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(note.noteColor)),
                        child: ListTile(
                          title: Text(state.notes[index].noteText),
                          subtitle: Text(note.createdDate.toString()),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdateNoteScreen(note: note),
                              ),
                            );
                          },
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              BlocProvider.of<NoteBloc>(context)
                                  .add(DeleteNote(id: state.notes[index].id!));

                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else if (state is NoteErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('state'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          // Navigate to AddScreen when FAB is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        child:const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}


