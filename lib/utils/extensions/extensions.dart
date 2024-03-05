import 'package:flutter/material.dart';

double height = 0.0;
double width = 0.0;

extension SizeUtils on num {
  double get h => (this / 896) * height;

  double get w => (this / 414) * width;

  SizedBox getH() {
    return SizedBox(
      height: (this / 896) * height,
    );
  }

  SizedBox getW() {
    return SizedBox(
      width: (this / 414) * width,
    );
  }
}
extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
    }
    }
}