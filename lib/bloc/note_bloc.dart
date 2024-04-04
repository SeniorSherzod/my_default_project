import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/local/local_storage.dart';
import '../data/models/note_model.dart';
import '../bloc/note_event.dart';
import '../bloc/note_state.dart';

class NoteBloc extends Bloc<NotesEvent, NoteState> {
  final LocalDatabase localDatabase;

  NoteBloc({required this.localDatabase}) : super(NoteInitialState()) {
    on<GetNotesEvent>(_getNotes);
    on<AddNote>(_addNote);
    on<DeleteNote>(_deleteNote);
    on<UpdateNote>(_updateNote);
  }

  Future<void> _getNotes(
      GetNotesEvent event,
      Emitter<NoteState> emit,
      ) async {
    emit(NoteLoadingState());
    try {
      List<NoteModel> notes = await localDatabase.getAllNotes();
      emit(NoteLoadedState(notes: notes));
    } catch (e) {
      emit(NoteErrorState(message: 'Failed to fetch notes'));
    }
  }

  Future<void> _addNote(
      AddNote event,
      Emitter<NoteState> emit,
      ) async {
    emit(NoteLoadingState());
    try {
      NoteModel savedNote = await localDatabase.insertNote(event.note);
      emit(NoteLoadedState(notes: [savedNote]));
    } catch (e) {
      emit(NoteErrorState(message: 'Failed to add note'));
    }
  }

  Future<void> _deleteNote(
      DeleteNote event,
      Emitter<NoteState> emit,
      ) async {
    emit(NoteLoadingState());
    try {
      await localDatabase.deleteNote(event.index);
      List<NoteModel> notes = await localDatabase.getAllNotes();
      emit(NoteDeletedState(notes: notes));
    } catch (e) {
      emit(NoteErrorState(message: 'Failed to delete note'));
    }
  }

  Future<void> _updateNote(
      UpdateNote event,
      Emitter<NoteState> emit,
      ) async {
    emit(NoteLoadingState());
    try {
      await localDatabase.updateNote(event.updatedNote);
      List<NoteModel> notes = await localDatabase.getAllNotes();
      emit(NoteLoadedState(notes: notes));
    } catch (e) {
      emit(NoteErrorState(message: 'Failed to update note'));
    }
  }
}
