import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import '../../../bloc/note_bloc.dart';
import '../../../bloc/note_event.dart';
import '../../../data/models/note_model.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_7C7C7C,
      appBar: AppBar(
        backgroundColor: AppColors.c_7C7C7C,
        elevation: 0,
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Enter your note'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addNote();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _addNote() {
    final noteText = _textController.text;
    if (noteText.isNotEmpty) {
      BlocProvider.of<NoteBloc>(context).add(
        AddNote(
          NoteModel(
            noteText: noteText,
            createdDate: DateTime.now(),
            noteColor: 0xFF53b175, // You can set your desired default color here
          ), note: NoteModel.randomColor(noteText: noteText, createdDate: DateTime.now(),
        ),
      ));
    }
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
