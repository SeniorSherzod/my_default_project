import 'package:flutter/material.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';

Widget numberButton(
    String buttonText, Color buttonColor, void Function()? buttonPressed,BuildContext context) {
  return Container(
    width:110,
    height: 110,
    padding: const EdgeInsets.all(0),
    decoration: BoxDecoration(
      color: AppColors.black,
      borderRadius: BorderRadius.circular(80)
    ),
    child: TextButton(
      onPressed: (){},
      style: ElevatedButton.styleFrom(
          shape:  RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(80),

          ),
          backgroundColor: buttonColor),
      child: Text(buttonText,
        style: const TextStyle(fontSize: 27, color: Colors.white),
      ),
    ),
  );
}
