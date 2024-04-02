import 'package:flutter/material.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';

Widget checkButton(
    Color buttonColor, void Function()? buttonPressed,BuildContext context) {
  return Container(
    width:25,
    height: 25,
    padding: const EdgeInsets.all(0),
    decoration: BoxDecoration(
        color: AppColors.c_7C7C7C,
        borderRadius: BorderRadius.circular(50)
    ),
      );
}
