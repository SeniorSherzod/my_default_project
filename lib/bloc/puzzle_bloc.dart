import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/bloc/puzzle_event.dart';
import 'package:my_default_project/bloc/puzzle_state.dart';

class PuzzleBloc extends Bloc<PuzzleEvent, PuzzleState> {
  final int _size = 4;

  PuzzleBloc() : super(InitialState(List.generate(16, (index) => index + 1))) {
    on<ShuffleEvent>((event, emit) {
      final shuffledTiles = state.tiles.toList()..shuffle();
      emit(ShuffledState(shuffledTiles, shuffledTiles.indexOf(16)));
    });
    on<MoveTileEvent>((event, emit) {
      // Handle move tile event
    });
    on<WinEvent>((event, emit) {
      // Handle win event
    });
  }

// Helper methods for move validation and win condition
}
