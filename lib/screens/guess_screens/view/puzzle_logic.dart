import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../puzzle_controller.dart';

class EndGameDialog extends StatelessWidget {
  const EndGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Text("Time's up!", style: TextStyle(color: Colors.green)),
      content: Text("Do you want to play again?"),
      actions: <Widget>[
        TextButton(
          child: Text("Cancel", style: TextStyle(color: Colors.green)),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text("Play Again", style: TextStyle(color: Colors.green)),
          onPressed: () {
            Navigator.pop(context);
            Get.find<PuzzleController>().resetGame();
            Get.find<PuzzleController>().shuffleTiles();

          },
        ),
      ],
    );
  }
}