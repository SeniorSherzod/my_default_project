import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_default_project/utils/images/app_images.dart';

class PuzzleController extends GetxController {
  int gridSize = 4;
  RxList<int> tiles = List<int>.generate(16, (index) => index + 1).obs;
  Timer? timer;
  RxBool gameEnded = false.obs;
  RxInt elapsedTime = 0.obs;
  RxInt moveCount = 0.obs;

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void onInit() {
    super.onInit();
  }

  void startTimer() async{
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedTime.value++;
    });
    await audioPlayer.play(AssetSource(AppImages.track));
  }

  void shuffleTiles() {
    var random = Random();
    tiles.shuffle(random);
    tiles.refresh();
    if (isSolved()) {
      shuffleTiles();
    }
  }

  bool isSolved() {
    for (int i = 0; i < tiles.length - 1; i++) {
      if (tiles[i] != i + 1) return false;
    }
    return true;
  }

  void moveTile(int index) {
    int zeroIndex = tiles.indexOf(16);
    if (zeroIndex == index) return;

    int row = index ~/ gridSize;
    int column = index % gridSize;
    int zeroRow = zeroIndex ~/ gridSize;
    int zeroColumn = zeroIndex % gridSize;

    if ((row == zeroRow && (column == zeroColumn + 1 || column == zeroColumn - 1)) ||
        (column == zeroColumn && (row == zeroRow + 1 || row == zeroRow - 1))) {
      tiles[zeroIndex] = tiles[index];
      tiles[index] = 16;
      moveCount.value++;
      tiles.refresh();

      if (isSolved()) {
        gameEnded.value = true;
        timer?.cancel();
        showCongratulationsDialog();
      }
    }
  }

  void resetGame()async {
    shuffleTiles();
    gameEnded.value = false;
    elapsedTime.value = 0;
    moveCount.value = 0;
    timer?.cancel();
    startTimer();
    await audioPlayer.play(AssetSource(AppImages.track));

  }

  void showCongratulationsDialog() {
    Get.dialog(
      AlertDialog(
        title: Text("Conguratulations!🥳 "),
        content: Text("You solved ${elapsedTime.value} second and ${moveCount.value}  times"),
        actions: <Widget>[
          Lottie.asset(AppImages.lottie),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Get.back(); // Dialogni yopish
                  resetGame();
                },
                child: Text('Restart'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
  void winGame() async {
    tiles.value = List<int>.generate(gridSize * gridSize, (index) => index + 1);
    tiles[gridSize * gridSize - 1] = 16;
    gameEnded.value = true;
    timer?.cancel();
    showCongratulationsDialog();
    await audioPlayer.stop();
  }
  void loseGame() async {
    await audioPlayer.stop();
    Get.dialog(
      AlertDialog(
        title: Text("Oops 😔 😔 😔 😔 "),
        content: Text("You couldn't solve the puzzle in time. Do you want to try again?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
              resetGame();
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
              // Handle other actions like navigating to a different screen or exiting the game
            },
            child: Text('No'),
          ),
        ],
      ),
    );
  }

}