import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/fourth_screen.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool _first = true;
  double _fontSize = 60;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Animate TextStyle"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FourthScreen()),
            );
          },
              child: Text("Next",style: AppTextStyle.GilroyThin.copyWith(color:AppColors.c_1A72DD ),))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 2),
            curve: Curves.bounceInOut,
            style: TextStyle(
              fontSize: _fontSize,
              color: _color,
              fontWeight: FontWeight.bold,
            ),
            child: const Text(
              "Hello flutter World",
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

            IconButton(onPressed: (){
              setState(() {
                _fontSize = _first ? 70 : 25;
                _color = _first ? Colors.blue : Colors.red;
                _first = !_first;
              });
            },
                icon: Icon(Icons.play_circle_filled_sharp)),
            IconButton(onPressed: (){
              setState(() {
                _fontSize = _first ? 70 : 25;
                _color = _first ? Colors.blue : Colors.red;
                _first = !_first;
              });
            },
                icon: Icon(Icons.lock_reset))
          ],)
        ],
      ),

    );
  }
}