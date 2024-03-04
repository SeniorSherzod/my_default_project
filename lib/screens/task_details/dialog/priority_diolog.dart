import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';

showPriority({
  required BuildContext context,
  required ValueChanged<int> priority,
  required int p,
}) {

  showDialog(
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 90),
        child: Material(
          color: const Color(0xFF363636),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                "Task Priority",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.w,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppImages.flag,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 2.h,
                width: double.infinity,
                color: Colors.white,
              ),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(24.w),
                  crossAxisCount: 4,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  children: List.generate(
                    10,
                        (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          p = index + 1; // Update p directly
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          color: p == index + 1
                              ? AppColors.main
                              : const Color(0xFF272727),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(AppImages.flag),
                            Text(
                              "${index + 1}",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: AppImages.flag,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: AppColors.main,
                              fontSize: 16.w,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppImages.flag,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState((){});
                        priority.call(p); // Pass p directly to the callback
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          color: AppColors.main,
                        ),
                        width: 150.w,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Center(
                          child: Text(
                            "Save",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.w,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppImages.flag,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );
    }),
  );
}
