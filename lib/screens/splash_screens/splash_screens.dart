import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:my_default_project/bloc/note_bloc.dart';
import 'package:my_default_project/bloc/note_event.dart';
import 'package:my_default_project/screens/home_screen/home_screen.dart';

import '../../bloc/note_state.dart';
import '../../utils/images/app_images.dart'; // Import the HomeScreen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize NoteBloc and fetch notes when splash screen is displayed
    BlocProvider.of<NoteBloc>(context).add(GetNotesEvent());

    return BlocListener<NoteBloc, NoteState>(
      listener: (context, state) {
        if (state is NoteLoadedState) {
          // Notes are loaded, navigate to the home screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black, // Set background color as needed
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Replace the 'animation.json' with your Lottie animation file
              Lottie.asset(AppImages.lotty),
              // Add any additional widgets or text below the Lottie animation
              const SizedBox(height: 20),
              const Text(
                'Note App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
