import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/third_screen.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class FlutterLogoBlack extends StatefulWidget {
  const FlutterLogoBlack({Key? key});

  @override
  State<FlutterLogoBlack> createState() => _FlutterLogoBlackState();
}

class _FlutterLogoBlackState extends State<FlutterLogoBlack> {
  bool isBigger = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("FlutterLogo"),

        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                width: 300,
                height: 300,
                duration: const Duration(seconds: 10),
                curve: Curves.easeInOutBack,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      color: isBigger ?  AppColors.white : AppColors.black),
                  child: FlutterLogo(
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  isBigger = !isBigger;
                  setState(() {});
                },
                child:
                isBigger ? const Text("Decrease") : const Text("Increase"))
          ],
        ));
  }
}