import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/flutter_logoblack.dart';
import 'package:my_default_project/screens/animation_screens/second_screen.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

class FourScreenCircleColor extends StatefulWidget {
  const FourScreenCircleColor({Key? key}) : super(key: key);

  @override
  State<FourScreenCircleColor> createState() => _FourScreenCircleColorState();
}

class _FourScreenCircleColorState extends State<FourScreenCircleColor>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = Tween<double>(begin: 0, end: 4 * pi).animate(
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
    animationController.repeat(reverse: true);
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
        title: const Text("four color circle task"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FlutterLogoBlack()),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Transform.rotate(
              angle: animation.value,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: AppColors.transparent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 10 * animation.value,
                          height: 10 * animation.value,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.yellow),
                        ),
                        Container(
                          width: 10 * animation.value,
                          height: 10 * animation.value,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 10 * animation.value,
                          height: 10 * animation.value,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.red),
                        ),
                        Container(
                          width: 10 * animation.value,
                          height: 10 * animation.value,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
