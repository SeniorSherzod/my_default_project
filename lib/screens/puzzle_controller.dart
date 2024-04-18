import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PuzzleController extends GetxController {
  var tiles = List<int>.generate(16, (i) => i + 1);
  var emptyTileIndex = 15.obs;
  var movementCount = 0.obs;
  final stopwatch = Stopwatch()..start();

  void shuffle() {
    tiles.shuffle();
    movementCount.value = 0;
    stopwatch.reset();
    stopwatch.start();
    update();
  }

  void moveTile(int tileIndex) {
    if (isMovable(tileIndex)) {
      int temp = tiles[emptyTileIndex.value];
      tiles[emptyTileIndex.value] = tiles[tileIndex];
      tiles[tileIndex] = temp;
      emptyTileIndex.value = tileIndex;
      movementCount.value++;
      update();
      if (isSolved()) {
        showWinDialog();
      }
    }
  }

  bool isMovable(int tileIndex) {
    int rowDiff = (emptyTileIndex.value ~/ 4) - (tileIndex ~/ 4);
    int colDiff = (emptyTileIndex.value % 4) - (tileIndex % 4);
    return (rowDiff.abs() == 1 && colDiff == 0) ||
        (rowDiff == 0 && colDiff.abs() == 1);
  }

  bool isSolved() {
    return List.generate(16, (i) => i + 1) == tiles;
  }

  String getFormattedTime() {
    final elapsedMilliseconds = stopwatch.elapsedMilliseconds;
    int minutes = (elapsedMilliseconds / Duration.millisecondsPerMinute).floor();
    int seconds = ((elapsedMilliseconds % Duration.millisecondsPerMinute) / Duration.secondsPerMinute).floor();
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void showWinDialog() {
    Get.dialog(
      Center(
        child: Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'You Win!',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Time: ${getFormattedTime()} Movements: ${movementCount.value}',
                ),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}