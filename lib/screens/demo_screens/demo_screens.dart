import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/screens/demo_screens/puzzle_grid.dart';

import '../../bloc/puzzle_bloc.dart';
import '../../bloc/puzzle_event.dart';

class PuzzleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PuzzleBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('15 Puzzle')),
        body: PuzzleGrid(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<PuzzleBloc>().add(ShuffleEvent()),
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
