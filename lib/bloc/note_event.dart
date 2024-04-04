

import '../data/models/note_model.dart';
abstract class NotesEvent{}

 class GetNotesEvent extends NotesEvent {}


class AddNote extends NotesEvent {
  final NoteModel note;
   AddNote(NoteModel noteModel, {required this.note});
  // @override
  // List<Object> get props => [note];
}

class DeleteNote extends NotesEvent {
  final int index;

   DeleteNote({required this.index});

  // @override
  // List<Object> get props => [index];
}

class UpdateNote extends NotesEvent {
  final int index;
  final NoteModel updatedNote;

   UpdateNote({required this.index,required this.updatedNote});

  // @override
  // List<Object> get props => [index, updatedNote];
}
