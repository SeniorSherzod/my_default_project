import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/bloc/note_bloc.dart';
import 'package:my_default_project/data/models/note_model.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';

import '../../bloc/note_event.dart';

class UpdateNoteScreen extends StatefulWidget {
  final NoteModel note;

  const UpdateNoteScreen({super.key, required this.note});

  @override
  UpdateNoteScreenState createState() => UpdateNoteScreenState();
}

class UpdateNoteScreenState extends State<UpdateNoteScreen> {
  late TextEditingController _textController;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.note.noteText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_7C7C7C,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: const Text('Update Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  minLines: 10,
                  controller: _textController,
                  maxLines: null, // Allow unlimited lines
                  keyboardType: TextInputType.multiline, // Allow multiline input
                  decoration: const InputDecoration(labelText: 'Enter your note'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedNote = NoteModel(
                  id: widget.note.id,
                  noteText: _textController.text,
                  createdDate: widget.note.createdDate,
                  noteColor: widget.note.noteColor,
                );
                BlocProvider.of<NoteBloc>(context).add(
                  UpdateNote(
                    updatedNote: updatedNote,
                    id: widget.note.id!,
                  ),
                );
                Navigator.pop(context);

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Update'),
            ),
          ],
        ),
      ),
      floatingActionButton: isEditing
          ? FloatingActionButton(
        onPressed: () {
          // Show dialog to save or discard changes
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Save Changes?'),
              content: const Text('Do you want to save changes?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    setState(() {
                      isEditing = false; // Discard changes
                    });
                  },
                  child: const Text('Discard'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save changes
                    final updatedNote = NoteModel(
                      id: widget.note.id,
                      noteText: _textController.text,
                      createdDate: widget.note.createdDate,
                      noteColor: widget.note.noteColor,
                    );
                    BlocProvider.of<NoteBloc>(context).add(
                      UpdateNote(
                        updatedNote: updatedNote,
                        id: widget.note.id!,
                      ),
                    );
                    Navigator.pop(context); // Close dialog
                    setState(() {
                      isEditing = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Save'),
                ),

              ],
            ),
          );
        },
        child: const Icon(Icons.save),
      )
          : null,
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
