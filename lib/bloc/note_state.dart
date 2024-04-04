import '../data/models/note_model.dart';
abstract class NoteState{}

class NoteInitialState extends NoteState {}

class NoteLoadingState extends NoteState {}

class NoteLoadedState extends NoteState {
  final List<NoteModel> notes;

  NoteLoadedState({required  this.notes});
}
class NoteDeletedState extends NoteState {
  final List<NoteModel> notes;

  NoteDeletedState({required  this.notes});
}

class NoteErrorState extends NoteState {
  final String message;

  NoteErrorState( {required this.message});

}
