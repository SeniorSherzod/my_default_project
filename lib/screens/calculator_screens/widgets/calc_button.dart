import 'package:flutter/material.dart';
import 'package:my_default_project/view_model/calculator_view_model/calculator_view.dart';
import 'package:provider/provider.dart';

Widget calcButton(
    String buttonText, Color buttonColor, void Function()? buttonPressed,BuildContext context) {
  return Container(
    width:buttonText=="0"? 180:90,
    height: 90,
    padding: const EdgeInsets.all(0),
    child: TextButton(
      onPressed: () => context.read<CalculatorViewModel>().buttonPressed(buttonText),
      style: ElevatedButton.styleFrom(
          shape:  RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(50)),
          backgroundColor: buttonColor),
      child: Text(buttonText,
        style: const TextStyle(fontSize: 27, color: Colors.white),
      ),
    ),
  );
}

