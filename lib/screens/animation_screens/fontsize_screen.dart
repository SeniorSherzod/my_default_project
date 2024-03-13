import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/box_tocircle_screen.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';

import '../../utils/styles/app_text_style.dart';

class FontSizeChangeScreen extends StatefulWidget {
  const FontSizeChangeScreen({Key? key}) : super(key: key);

  @override
  _FontSizeChangeScreenState createState() => _FontSizeChangeScreenState();
}

class _FontSizeChangeScreenState extends State<FontSizeChangeScreen> {
  double _fontSize = 20.0;
  bool _isIncreased = false;

  void _toggleFontSize() {
    setState(() {
      _isIncreased = !_isIncreased;
      _fontSize = _isIncreased ? 30.0 : 20.0; // Change font size here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size Change Animation'),

        actions: [ TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BoxCircleShapeAnimationScreen()),
          );
        },
            child: Text("Next",style: AppTextStyle.GilroyThin.copyWith(color:AppColors.c_1A72DD ),))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                style: TextStyle(fontSize: _fontSize, color: Colors.black),
                child: Text('The AnimatedContainer will automatically animate between the old and new values of properties when they change using the provided curve and duration. Properties that are null are not animated. Its child and descendants are not animated.'),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: _toggleFontSize,
              child: Text(
                'Toggle Font Size',
                style: TextStyle(color: AppColors.c_1A72DD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
