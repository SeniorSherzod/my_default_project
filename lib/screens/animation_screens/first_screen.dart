import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/second_screen.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    animation = Tween<double>(begin: 0, end: 10 * pi).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First task"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
            child: Text(
              "Next",
              style:
              AppTextStyle.GilroyBold.copyWith(color: AppColors.c_1A72DD),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Transform.rotate(
              angle: animation.value,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero, color: AppColors.c_1A72DD),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
