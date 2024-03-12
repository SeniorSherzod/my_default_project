import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';

class SecondScreenTextField extends StatelessWidget {
  const SecondScreenTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.yellow.withOpacity(0.6)
            ),
              boxShadow: [
            BoxShadow(
              spreadRadius: 16,
              blurRadius: 12,
              color: Colors.grey.shade50,
            ),

          ]),
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: IconButton(onPressed: (){},icon: SvgPicture.asset(AppImages.search,),),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16)),
              contentPadding: EdgeInsets.symmetric(
                vertical: 18.h,
                horizontal: 15,
              ),
              hintStyle: AppTextStyle.GilroyRegular.copyWith(
                fontSize: 12,
                color: AppColors.yellow,
              ),
              hintText: "Search ",
              fillColor: AppColors.white,
              filled: true,
            ),
          ),
        ),
        SizedBox(width: 15,),
        Positioned(
            top: 0,
            right: 30.w,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              //width: 47.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: SvgPicture.asset(AppImages.filter),
              ),
            )
        )
      ],
    );
  }
}
