
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/note_bloc.dart';
import '../../../bloc/note_event.dart';
import '../../../data/models/note_model.dart';

void showAddNoteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      final TextEditingController _textController = TextEditingController();
      return AlertDialog(
        title:const Text('Add Note'),
        content: TextField(
          controller: _textController,
          decoration: InputDecoration(labelText: 'Enter your note'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child:const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final noteText = _textController.text;
              if (noteText.isNotEmpty) {
                BlocProvider.of<NoteBloc>(context).add(
                  AddNote(
                    NoteModel(
                      noteText: noteText,
                      createdDate: DateTime.now(),
                      noteColor: 0xFF53b175,
                    ), note: NoteModel.randomColor(noteText: noteText, createdDate: DateTime.now()),
                  ),
                );
              }
              Navigator.pop(context);
            },
            child:const Text('Add'),
          ),
        ],
      );
    },
  );
}