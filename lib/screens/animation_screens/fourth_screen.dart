import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/fifth_screen.dart';
import 'package:my_default_project/screens/animation_screens/third_screen.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  State<FourthScreen> createState() => _ExampleEightState();
}

class _ExampleEightState extends State<FourthScreen> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedOpacity"),
        actions: [ TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FifthScreen()),
          );
        },
            child: Text("Next",style: AppTextStyle.GilroyThin.copyWith(color:AppColors.c_1A72DD ),))],
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 3),
          curve: Curves.decelerate,
          child:Container(
            width: 250,
            height: 250,
            decoration:const BoxDecoration(
                borderRadius: BorderRadius.zero,
                color: AppColors.c_53b175),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeOpacity,
        child:Icon(Icons.price_change_outlined),
      ),
    );
  }
}