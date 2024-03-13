import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/third_screen.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isBigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("FirstGif"),
          actions: [
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirdScreen()),
              );
            },
                child: Text("Next",style: AppTextStyle.GilroyThin.copyWith(color:AppColors.c_1A72DD ),))
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedContainer(
                width: isBigger ? 300 : 100,
                duration: const Duration(seconds: 3),
                curve: Curves.easeInOutBack,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration:const BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      color: AppColors.c_1A72DD),
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