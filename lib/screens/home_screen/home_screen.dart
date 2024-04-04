import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:my_default_project/bloc/note_bloc.dart';
import 'package:my_default_project/bloc/note_event.dart';
import 'package:my_default_project/bloc/note_state.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:my_default_project/data/models/note_model.dart'; // Import your NoteModel

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.black.withOpacity(0.5),
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteLoadingState) {
            return Center(child: CircularProgressIndicator());
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
                  return ListTile(
                    title: Text(note.noteText),
                    subtitle: Text(note.createdDate.toString()),
                  );
                },
              );
            }
          } else if (state is NoteErrorState) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNoteDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddNoteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Note'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(labelText: 'Enter your note'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final noteText = _textController.text;
                if (noteText.isNotEmpty) {
                  BlocProvider.of<NoteBloc>(context).add(
                    AddNote(
                        NoteModel.randomColor(
                      noteText: noteText,
                      createdDate: DateTime.now(),
                    ), note: NoteModel(noteText: "Salom bolalar bugun nima mavzuda dars qilmoqchisiz", createdDate: DateTime.now(), noteColor: 0xFF1A72DD)),
                  );
                }
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
