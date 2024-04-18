Future onClick(List<int> list, int index, int moves) async {
  const int _puzzleSize = 3;
  int emptyTilePosIndex = list.indexOf(0);
  int emptyTilePosRow = emptyTilePosIndex ~/ _puzzleSize;
  int emptyTilePosCol = emptyTilePosIndex % _puzzleSize;

  int currentTileRow = index ~/ _puzzleSize;
  int currentTileCol = index % _puzzleSize;

  // single element moves up
  if ((currentTileRow - 1 == emptyTilePosRow) &&
      (currentTileCol == emptyTilePosCol)) {
    list[emptyTilePosIndex] = list[index];
    list[index] = 0;
    moves++;
  }

  // single element moves down
  else if ((currentTileRow + 1 == emptyTilePosRow) &&
      (currentTileCol == emptyTilePosCol)) {
    list[emptyTilePosIndex] = list[index];
    list[index] = 0;
    moves++;
  }

  // single element moves left
  else if ((currentTileRow == emptyTilePosRow) &&
      (currentTileCol + 1 == emptyTilePosCol)) {
    list[emptyTilePosIndex] = list[index];
    list[index] = 0;
    moves++;
  }

  // single element moves right
  else if ((currentTileRow == emptyTilePosRow) &&
      (currentTileCol - 1 == emptyTilePosCol)) {
    list[emptyTilePosIndex] = list[index];
    list[index] = 0;
    moves++;
  } else {
    if (currentTileCol == emptyTilePosCol) {
      int low;
      int high;

      // multiple elements move up
      if (emptyTilePosRow < currentTileRow) {
        low = emptyTilePosRow;
        high = currentTileRow;

        int i = low;
        while (i < high) {
          list[(i * _puzzleSize) + emptyTilePosCol] =
              list[(((i + 1) * _puzzleSize) + emptyTilePosCol)];

          i += 1;
        }

        list[(high * _puzzleSize) + emptyTilePosCol] = 0;
        moves++;
      }

      // multiple elements move down
      else {
        low = emptyTilePosRow;
        high = currentTileRow;

        int i = low;
        while (i > high) {
          list[(i * _puzzleSize) + emptyTilePosCol] =
              list[(((i - 1) * _puzzleSize) + emptyTilePosCol)];

          i -= 1;
        }

        list[(high * _puzzleSize) + emptyTilePosCol] = 0;
        moves++;
      }
    }

    // multiple elements move left or right
    if (currentTileRow == emptyTilePosRow) {
      int low;
      int high;

      // multiple elements move left
      if (emptyTilePosCol < currentTileCol) {
        low = emptyTilePosCol;
        high = currentTileCol;

        int i = low;
        while (i < high) {
          list[(emptyTilePosRow * _puzzleSize) + i] =
              list[(emptyTilePosRow * _puzzleSize) + (i + 1)];

          i += 1;
        }

        list[high + (emptyTilePosRow * _puzzleSize)] = 0;
        moves++;
      }

      // multiple elements move right
      else {
        low = emptyTilePosCol;
        high = currentTileCol;

        int i = low;
        while (i > high) {
          list[(i + (emptyTilePosRow * _puzzleSize))] =
              list[(i - 1) + (emptyTilePosRow * _puzzleSize)];

          i -= 1;
        }

        list[high + (emptyTilePosRow * _puzzleSize)] = 0;
        moves++;
      }
    }
  }

  Map<String, dynamic> myMap = {
    'list': list,
    'moves': moves,
  };
  return myMap;
}