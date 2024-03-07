import 'package:flutter/material.dart';
import '../utils/colors/app_colors.dart';
import '../utils/extensions/extensions.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.horizontalPadding,
    this.colors,
    required this.pixels,
    this.colorText,
    this.fontSize,
  });

  final VoidCallback onTap;
  final String title;
  final double horizontalPadding;
  final Color? colors;
  final double pixels;
  final Color? colorText;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      width: width,
      height: pixels,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.c_53b175, // your color here
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              title,
              // style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );

  }
}