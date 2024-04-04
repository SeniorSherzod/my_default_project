import '../data/models/note_model.dart';

abstract class NotesEvent {}

class GetNotesEvent extends NotesEvent {}

class AddNote extends NotesEvent {
  final NoteModel note;

  AddNote(NoteModel noteModel, {required this.note});
}

class DeleteNote extends NotesEvent {
  final int id;

  DeleteNote({required this.id});
}

class UpdateNote extends NotesEvent {
  final int id;
  final NoteModel updatedNote;

  UpdateNote({required this.id, required this.updatedNote});
}
