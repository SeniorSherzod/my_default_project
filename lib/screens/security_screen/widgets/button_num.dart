import 'package:flutter/material.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';
class NumberButton extends StatelessWidget {
  const NumberButton({super.key, required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.w),
      onTap: onTap,
      child:Container(
        width: 80.w,
        height: 80.h,
        decoration: const  BoxDecoration(
          color: AppColors.black,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,style: AppTextStyle.GilroyMedium.copyWith(color: AppColors.white,fontWeight: FontWeight.w500,fontSize: 30.w),
          ),
        ),
      ),
    );
  }
}