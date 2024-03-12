import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/screens/store_screen/widgets/categories.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import 'package:my_default_project/utils/images/app_images.dart';

import '../../utils/styles/app_text_style.dart';
import '../second_task_screen/second_task_scree.dart';
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final ScrollController scrollController = ScrollController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 350,
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 20,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                color: Colors.black,
                icon: const Icon(Icons.more_horiz),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            leading: Container(
              padding: const EdgeInsets.all(5),
              height: 50,
              child: IconButton(
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 20,
                ),
                onPressed: () {},
                color: Colors.black,
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(4, 4),
                      blurRadius: 10,
                      spreadRadius: 6,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      "Balance",
                      style: AppTextStyle.GilroyMedium.copyWith(fontSize: 30),
                    ),
                    SizedBox(
                      height: 150,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              4,
                                  (index) => Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                margin: EdgeInsets.only(right: 13.w),
                                padding: EdgeInsets.all(15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 36.w,
                                      height: 36.h,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                        BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 4),
                                            spreadRadius: 1,
                                            blurRadius: 40,
                                            color:
                                            Colors.black.withOpacity(0.1),
                                          )
                                        ],
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.euro,
                                            color: Colors.blue),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      "585.00",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19.w,
                                      ),
                                    ),
                                    Text(
                                      "EUR Balance",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.w,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(onPressed: (){},
                        child:  Text(
                          "See Balance details ",
                          style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20,color: AppColors.button),
                        ),),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == 0 ?  AppColors.button: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),)
                  ),
                  child: Text(
                    "Payment \$223",
                    style: AppTextStyle.GilroyMedium.copyWith(color: AppColors.c_a7a9be),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == 1 ? AppColors.button: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),)
                  ),
                  child: Text(
                    "Food",
                    style: AppTextStyle.GilroyMedium.copyWith(color: AppColors.c_a7a9be),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == 2 ? AppColors.button: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),)
                  ),
                  child: Text(
                    "Service",
                    style: AppTextStyle.GilroyMedium.copyWith(color: AppColors.c_a7a9be),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == 3 ? AppColors.button: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),)
                  ),
                  child: Text(
                    "Rent",
                    style: AppTextStyle.GilroyMedium.copyWith(color: AppColors.c_a7a9be),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ...List.generate(
                  100,
                      (index) => ListTile(
                    onTap: () {},
                    title: Text(
                      "Behance Project",
                      style: AppTextStyle.GilroyMedium.copyWith(fontSize: 16, color: Colors.black),
                    ),
                        leading: SizedBox(
                          width: 50,
                            child: Image.asset(AppImages.img)),
                        subtitle:Text(
                          "23rd March 2024",
                          style: AppTextStyle.GilroyMedium.copyWith(fontSize: 10, color: Colors.black),
                        ) ,
                        trailing:Text(
                          "223\$",
                          style: AppTextStyle.GilroyMedium.copyWith(fontSize: 10, color: Colors.black),
                        )  ,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

