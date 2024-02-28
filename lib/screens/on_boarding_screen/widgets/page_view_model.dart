import 'package:flutter/material.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';
import '../models/page_views_model.dart';
class PageViews extends StatelessWidget {
  const PageViews({super.key, required this.pageViewsModel, required this.horizontalPadding});

  final PageViewsModel pageViewsModel;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(pageViewsModel.iconPath),
          SizedBox(height: 50.h),
          Text(
            pageViewsModel.title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: AppTextStyle.GilroyBold.copyWith(
              fontSize: 24,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            pageViewsModel.subtitle,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: AppTextStyle.GilroyRegular.copyWith(
              fontSize: 16,
              color: AppColors.black.withOpacity(0.45),
            ),
          ),
          SizedBox(height: 40.h,),
        ],
      ),
    );
  }
}