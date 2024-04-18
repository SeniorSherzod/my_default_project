import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'guess_screens/word_controller.dart';

class Puzzlegame extends StatelessWidget {
  final puzzleController = Get.put(PuzzleController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('15 Puzzle'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: puzzleController.shuffle,
            ),
          ],
        ),
        body: Column(
          children: [
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Time: '),
                Text(puzzleController.getFormattedTime()),
              ],
            )),

            GridView.count(
              crossAxisCount: 4,
              children: List.generate(16, (index) {
                return GestureDetector(
                  onTap: () => puzzleController.moveTile(index),
                  child: Container(
                    margin: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: puzzleController.tiles[index] == 0
                          ? Colors.transparent
                          : Colors.primaries[index % Colors.primaries.length],
                    ),
                    child: Text(
                      puzzleController.tiles[index] == 0
                          ? ''
                          : puzzleController.tiles[index].toString(),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              }),
            ),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Time: '),
                Text(puzzleController.getFormattedTime()), // Replace this line
                Text(puzzleController.movementCount.value.toString()), // with this line
              ],
            )),

            Obx(() => puzzleController.isSolved()
                ? ElevatedButton(
              onPressed: puzzleController.showWinDialog,
              child: Text('You Win!'),
            )
                : SizedBox()),
          ],
        ),
      ),
    );
  }
}


