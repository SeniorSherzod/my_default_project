import 'package:flutter/material.dart';
import '../utils/colors/app_colors.dart';
import '../utils/extensions/extensions.dart';
import '../utils/styles/app_text_style.dart';

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
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 13),
          backgroundColor: colors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          side: BorderSide(
            color: AppColors.main, // your color here
            width: 1,
          ),
        ),
        onPressed: onTap,
        child: Text(title,
            style: AppTextStyle.GilroyBold
                .copyWith(fontSize: fontSize, color: colorText)),
      ),
    );
  }
}
