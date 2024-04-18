abstract class PuzzleEvent {}

class ShuffleEvent extends PuzzleEvent {}

class MoveTileEvent extends PuzzleEvent {
  final int index;

  MoveTileEvent(this.index);
}

class WinEvent extends PuzzleEvent {}
