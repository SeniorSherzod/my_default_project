import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/screens/second_task_screen/widgets/category.dart';
import 'package:my_default_project/screens/second_task_screen/widgets/second_secreen_searshtextfield.dart';
import 'package:my_default_project/screens/second_task_screen/widgets/slivergrid.dart';
import 'package:my_default_project/screens/store_screen/widgets/categories.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import 'package:my_default_project/utils/images/app_images.dart';

import '../../utils/styles/app_text_style.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final ScrollController scrollController = ScrollController();
  int selectedIndex = 0;
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              Container(
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.yellow)),
                child: IconButton(
                    onPressed: () {},
                    color: Colors.black,
                    icon: SvgPicture.asset(AppImages.bell)),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Hello",
                          style:
                              AppTextStyle.GilroyMedium.copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Fahmi",
                          style: AppTextStyle.GilroyMedium.copyWith(
                              fontSize: 20, color: AppColors.yellow),
                        ),
                      ],
                    ),
                    Text(
                      "find the right one  for\n a healthy body",
                      style: AppTextStyle.GilroyMedium.copyWith(
                          fontSize: 20, color: AppColors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SecondScreenTextField(),
                  ],
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: ProductItem(),
            pinned: true,
          ),
          // SliverGrid(delegate: delegate, gridDelegate: gridDelegate)
          SliverToBoxAdapter(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height:200,child: Image.asset(AppImages.img_6)),
                    SizedBox(height:200,child: Image.asset(AppImages.img_6)),
                    SizedBox(height:200,child: Image.asset(AppImages.img_6)),

                  ],
                )),
          ),
          SliverPersistentHeader(
            delegate: ProductItemsGrid(),
            pinned: true,
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (newActiveIndex) {
      //     setState(() {
      //       _activeIndex = newActiveIndex;
      //     });
      //   },
      //   currentIndex: _activeIndex,
      //   type: BottomNavigationBarType.fixed,
      //   selectedFontSize: 16,
      //   unselectedItemColor: AppColors.black,
      //   unselectedFontSize: 14,
      //   selectedItemColor: AppColors.black,
      //   backgroundColor: AppColors.c_1A72DD,
      //   items:  [
      //     BottomNavigationBarItem(
      //       activeIcon: SvgPicture.asset(AppImages.home,color: AppColors.white),
      //       icon:SvgPicture.asset(AppImages.home),
      //
      //     ),
      //     BottomNavigationBarItem(
      //       activeIcon: SvgPicture.asset(AppImages.category,color: AppColors.white),
      //       icon:SvgPicture.asset(AppImages.category,color: AppColors.black,),
      //
      //     ),
      //     BottomNavigationBarItem(
      //       activeIcon: SvgPicture.asset(AppImages.basket,color: AppColors.white),
      //       icon:SvgPicture.asset(AppImages.basket),
      //
      //     ),
      //     BottomNavigationBarItem(
      //       activeIcon: SvgPicture.asset(AppImages.sms,color: AppColors.white),
      //       icon:SvgPicture.asset(AppImages.sms),
      //
      //     ),
      //     BottomNavigationBarItem(
      //       activeIcon: SvgPicture.asset(AppImages.profile,color: AppColors.white),
      //       icon:SvgPicture.asset(AppImages.profile),
      //
      //     ),
      //   ],
      // ),
    );
  }
}
