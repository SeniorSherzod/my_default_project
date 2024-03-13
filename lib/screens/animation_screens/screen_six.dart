import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/seven_screen.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

class ColorChangeScreen extends StatefulWidget {
  const ColorChangeScreen({Key? key}) : super(key: key);

  @override
  _ColorChangeScreenState createState() => _ColorChangeScreenState();
}

class _ColorChangeScreenState extends State<ColorChangeScreen> {
  bool _isInitialValue = true;

  void _toggleColor() {
    setState(() {
      _isInitialValue = !_isInitialValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Change Animation'),
        actions: [ TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AlignmetChangeScreen()),
          );
        },
            child: Text("Next",style: AppTextStyle.GilroyThin.copyWith(color:AppColors.c_1A72DD ),))],
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleColor,
          child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            color: _isInitialValue ? Colors.blue : Colors.red,
            child: SizedBox(
                width: 250,
                height: 250,
                child: _isInitialValue
                    ? Center(
                        child: Text(
                        "first postion",
                        style: AppTextStyle.GilroyMedium.copyWith(
                            fontSize: 20, color: AppColors.white),
                      ))
                    : Center(child: Text("second postion", style: AppTextStyle.GilroyMedium.copyWith(
                    fontSize: 20, color: AppColors.white),))),
          ),
        ),
      ),
    );
  }
}
