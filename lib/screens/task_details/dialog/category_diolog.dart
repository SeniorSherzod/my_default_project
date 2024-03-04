import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/data/local/local_datebase.dart';
import 'package:my_default_project/screens/named_route.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import '../../../models/category_model/category_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import 'models_category/category_list.dart';

Future<String?> showCategory({
  required BuildContext context,
  required String category,
}) async {
  String? selectedCategory = category;
  List <CategoryModel> categoryModels= await LocalDatabase.getAllCategories();
  // if(!context.mounted)
  await showDialog(
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 90),
        child: Material(
          color: const Color(0xFF363636),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                "choose category",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.w,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppImages.flag,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 2.h,
                width: double.infinity,
                color: Colors.white,
              ),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(24.w),
                  crossAxisCount: 3,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  children: List.generate(
                    categoryModels.length + 1, // Add 1 for the "Add" button
                        (index) {
                      if (index == categoryModels.length) {
                        // Last item, render the "Add" button
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.addCategoryScreen, arguments:() async {categoryModels= await LocalDatabase.getAllCategories();
                            setState((){});
                            });

                          },
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4.w)),
                              color: const Color(0xFF272727),
                            ),
                            child:const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        );
                      } else {
                        final category = categoryModels[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category.name;
                            });
                          },
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4.w)),
                              color: selectedCategory == category.name
                                  ? AppColors.main
                                  : const Color(0xFF272727),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(category.iconPath),
                                Text(
                                  category.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: AppImages.flag,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.w,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    },
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
                        Navigator.pop(context, selectedCategory); // Pass selected category when popping
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
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      );
    }),
  );
  return selectedCategory; // Return the selected category
}
