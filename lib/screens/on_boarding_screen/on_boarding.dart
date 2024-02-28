import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_default_project/data/local/storage_repository.dart';
import 'package:my_default_project/screens/on_boarding_screen/widgets/active_circle.dart';
import 'package:my_default_project/screens/on_boarding_screen/widgets/page_view_model.dart';
import 'package:my_default_project/utils/constants/Storage_keys.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';
import '../../widgets/global_button.dart';
import '../named_route.dart';
import 'models/page_views_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int activeIndex = 0;
  final PageController pageController = PageController();

  List<PageViewsModel> pagesData = [
    PageViewsModel(
      iconPath: AppImages.img,
      title: "Your convenience in making a todo list",
      subtitle:
      """Here's a mobile platform that helps you create task
 or to list so that it can help you in every job
easier and faster.
      """,
    ),
    PageViewsModel(
      iconPath: AppImages.img_1,
      title: """
      Find the practicality in making your to do lists
      """,
      subtitle:
      """
      Here's a mobile platform that helps you create task
 or to list so that it can help you in every job
easier and faster.
      """,
    ),
    PageViewsModel(
      iconPath: AppImages.img_2,
      title: "Improve your skills",
      subtitle:
      "Quarantine is the perfect time to spend your"
          "day learning something new, from anywhere!",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: AppColors.transparent
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          actions: [TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.taskScreen,
                  arguments: 123);
              StorageRepository.setBool(
                  key: Storagekeys.onBoardingState, value: true);
            },
            child: Text(
              "SKIP",
              style: AppTextStyle.GilroyRegular.copyWith(
                  fontSize: 14, color: AppColors.main.withOpacity(0.45)),
            ),
          ),
          ],),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  ...List.generate(
                    pagesData.length,
                        (index) =>
                        PageViews(
                          pageViewsModel: pagesData[index],
                          horizontalPadding: index == 0 ? 70.w : 55.w,
                        ),
                  )
                ],
              ),
            ),
            BoardingBottomView(
              pagesData: pagesData,
              activeIndex: activeIndex,
              onTap: () {},
            ),
            SizedBox(height: 20.h),
            GlobalButton(onTap: () {
              if (activeIndex < pagesData.length - 1) {
                setState(() {
                  activeIndex++;
                });
                pageController.jumpToPage(activeIndex);
              } else {
                Navigator.pushReplacementNamed(context, RouteNames.taskScreen,
                    arguments: 123);
                StorageRepository.setBool(
                    key: Storagekeys.onBoardingState, value: true);

            }
            },
                pixels: 53,
                colors: AppColors.main,
                colorText: AppColors.white,
                title: activeIndex == pagesData.length - 1
                    ? "Let's start"
                    : "Next",
                horizontalPadding: 22.w),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

