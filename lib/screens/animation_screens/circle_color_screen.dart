import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/flutter_logoblack.dart';
import 'package:my_default_project/screens/animation_screens/four_circlecolor_screen.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';


class CircleShapeAnimationScreen extends StatefulWidget {
  const CircleShapeAnimationScreen({Key? key}) : super(key: key);

  @override
  _CircleShapeAnimationScreenState createState() => _CircleShapeAnimationScreenState();
}

class _CircleShapeAnimationScreenState extends State<CircleShapeAnimationScreen> {
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
        title: Text('Circle color Animation'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FourScreenCircleColor()),
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
            duration: const Duration(seconds: 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: _isInitialValue ? 1 : 30, color: Colors.grey[800]!),
              color: _isInitialValue ? Colors.green : Colors.yellow,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500]!,
                  blurRadius: 4,
                  spreadRadius: 4,
                ),
              ],
            ),
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
