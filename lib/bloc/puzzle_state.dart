abstract class PuzzleState {
  get tiles => tiles;
}

class InitialState extends PuzzleState {
  final List<int> tiles;

  InitialState(this.tiles);
}

class ShuffledState extends PuzzleState {
  final List<int> tiles;
  final int emptyTileIndex;

  ShuffledState(this.tiles, this.emptyTileIndex);
}

class WonState extends PuzzleState {
  @override
  final List<int> tiles;
  final int emptyTileIndex;

  WonState(this.tiles, this.emptyTileIndex);
}
