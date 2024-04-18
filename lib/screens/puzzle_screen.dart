import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'guess_screens/puzzle_controller.dart';


class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final PuzzleController controller = Get.put(PuzzleController());


    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Style'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              controller.shuffleTiles();
            },
            icon: Icon(Icons.shuffle),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() => Text(
                    'Time: ${controller.elapsedTime} s',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  Obx(() => Text(
                    'Movement: ${controller.moveCount}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Obx(
                        () => GridView.builder(
                      itemCount: controller.tiles.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: controller.gridSize,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => controller.moveTile(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: controller.tiles[index] == 16 ? Colors.cyanAccent : Colors.green[400],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              controller.tiles[index] == 16 ? '' : controller.tiles[index].toString(),
                              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                        () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(fontSize: 25),
                      ),
                      onPressed: controller.gameEnded.value ? null : () => controller.resetGame(),
                      child: const Text('Start'),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(fontSize: 25),
                    ),
                    onPressed: controller.gameEnded.value ? null : () => controller.winGame(),
                    child: const Text('Win \$'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(fontSize: 25),
                    ),
                    onPressed: controller.gameEnded.value ? null : () => controller.loseGame(),
                    child: const Text('Lose'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
