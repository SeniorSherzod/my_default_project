import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/data/local/local_datebase.dart';
import 'package:my_default_project/models/category_model/category_model.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/images/app_images.dart';

import '../../utils/styles/app_text_style.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key, this.onCategoryAdded});

  final VoidCallback? onCategoryAdded;

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  String categoryName = '';
  int selectedIconIndex = -1;
  int selectedColorIndex = -1;

  List<Color> colors = [
    Color(0xFFE86C62),
    Color(0xFF3688F2),
    Color(0xFF73A954),
    Color(0xFFF09643),
    Color(0xFFE7A4CF),
    Color(0xFFF5D155),
    Color(0xFF516171),
    Color(0xFF36C5F0),
    Color(0xFFFF486A),
  ];

  List<String> icons = [
    AppImages.bread,
    AppImages.home,
    AppImages.sport,
    AppImages.social,
    AppImages.movie,
    AppImages.music,
    AppImages.university,
    AppImages.work,
    AppImages.health,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: Text("Add Category"),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              onChanged: (v) {
               categoryName = v;
                },
              decoration: InputDecoration(
                fillColor: AppColors.white,
                filled: true,
                hintText: "Enter new category name here",
                helperStyle: AppTextStyle.GilroyMedium.copyWith
                  (color: AppColors.main, fontSize: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.main
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: AppColors.main
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.white,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.white,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  icons.length,
                      (index) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          selectedIconIndex = index;
                        });
                      },
                      icon: SvgPicture.asset(
                        icons[index] as String,
                        color: selectedIconIndex == index
                            ? Colors.green
                            : AppColors.black,
                        width: 42,
                        height: 42,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  colors.length,
                      (index) => IconButton(
                    onPressed: () {
                      setState(() {
                        selectedColorIndex = index;
                      });
                    },
                    icon: Stack(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: colors[index],
                            shape: BoxShape.circle,
                          ),
                        ),
                        if (selectedColorIndex == index)
                         const Positioned(
                            top: 0,
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                if (selectedColorIndex > -1 &&
                    selectedIconIndex > -1 &&
                    categoryName.isNotEmpty) {
                  await LocalDatabase.insertCategory(
                    CategoryModel(
                      iconPath: icons[selectedIconIndex],
                      name: categoryName,
                      color: colors[selectedColorIndex].toString(),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Category saved!!",style: AppTextStyle.GilroyMedium.copyWith
                        (color: AppColors.main, fontSize: 12),),
                    ),
                  );
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.pop(context);
                  if(widget.onCategoryAdded !=null){
                  widget.onCategoryAdded?.call();
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("ERROR"),
                    ),
                  );
                }
              },
              child: Text("ADD CATEGORY",style: AppTextStyle.GilroyMedium.copyWith
                (color: AppColors.main, fontSize: 12),),
            ),
          ],
        ),
      ),
    );
  }
}
