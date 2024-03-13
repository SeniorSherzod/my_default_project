import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/circle_color_screen.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class BoxCircleShapeAnimationScreen extends StatefulWidget {
  const BoxCircleShapeAnimationScreen({Key? key}) : super(key: key);

  @override
  _BoxCircleShapeAnimationScreenState createState() =>
      _BoxCircleShapeAnimationScreenState();
}

class _BoxCircleShapeAnimationScreenState
    extends State<BoxCircleShapeAnimationScreen> {
  bool _isInitialValue = true;

  void _toggleValues() {
    setState(() {
      _isInitialValue = !_isInitialValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Shape Animation'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CircleShapeAnimationScreen()),
              );
            },
            child: Text(
              "Next",
              style:
                  AppTextStyle.GilroyThin.copyWith(color: AppColors.c_1A72DD),
            ),
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleValues,
          child: AnimatedContainer(
            duration: const Duration(seconds: 10),
            decoration: BoxDecoration(
              shape: _isInitialValue ? BoxShape.rectangle : BoxShape.circle,
              border: Border.all(width: _isInitialValue ? 1 : 10),
              color: _isInitialValue ? Colors.blue : Colors.red,
            ),
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
