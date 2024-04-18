import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/puzzle_bloc.dart';
import '../../bloc/puzzle_event.dart';
import '../../bloc/puzzle_state.dart';

class PuzzleGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleBloc, PuzzleState>(
      builder: (context, state) {
        // Build puzzle grid based on current state
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: 16,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (state is ShuffledState) {
                  final emptyTileIndex = state.emptyTileIndex;
                  // Calculate tapped tile index based on row and column
                  final row = index ~/ 4;
                  final col = index % 4;
                  final tileIndex = row * 4 + col;
                  context.read<PuzzleBloc>().add(MoveTileEvent(tileIndex));
                }
              },
              child: Container(
                // Build tile UI based on tile value
                margin: EdgeInsets.all(4),
                color: state is ShuffledState && state.tiles[index] == 16 ? Colors.transparent : Colors.blue,
                child: Center(
                  child: Text(
                    '${state is ShuffledState ? state.tiles[index] : index + 1}',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
