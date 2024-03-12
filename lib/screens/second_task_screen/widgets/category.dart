import 'package:flutter/material.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';

class ProductItem extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    List<String> images = [
      AppImages.img_1,
      AppImages.img_2,
      AppImages.img_3,
      AppImages.img_4,
      AppImages.img_5
    ];
    List<String> names = [
      "Vegetables",
      "Fruit",
      "Spice",
      "Ingredients",
      "Dishes"
    ];
    return Material(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Text("Category",
                        style: AppTextStyle.GilroyBold.copyWith(fontSize: 14.w)),
                    // Spacer(),
                    Text("Show All",
                        style: AppTextStyle.GilroyBold.copyWith(fontSize: 14.w)),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    ...List.generate(
                      images.length,
                          (index) => Row(
                        children: [
                          SizedBox(width: 10.w), // Added spacing
                          Container(
                            height: 100.h, // Adjusted image height
                            width: 100.w, // Adjusted image width
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.w),
                              color: AppColors.c_a7a9be,
                            ),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20.w), // Added spacing
                          Text(names[index],
                              style: AppTextStyle.GilroyBold.copyWith(fontSize: 14.w)),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w), // Added spacing
                  ],
                ),
              ),
              SizedBox(height: 20.h)
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 150.h;

  @override
  double get minExtent => 100.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
