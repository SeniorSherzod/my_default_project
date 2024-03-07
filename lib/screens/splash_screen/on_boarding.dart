import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../widgets/global_button.dart';
import '../named_route.dart';
import 'models/page_models.dart';
import 'models/page_view.dart';

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
      iconPath: AppImages.splash1,
      title: "on_board".tr(),
    ),
    PageViewsModel(
      iconPath: AppImages.splash2,
      title: "on_board".tr(),
    ),
    PageViewsModel(
      iconPath: AppImages.splash3,
      title: "on_board".tr(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.helloScreen);
              // Navigator.pop(context);
              // StorageRepository.setBool(
              //     key: Storagekeys.onBoardingState, value: true);
            },
            child: const Text("SKIP"),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                ...List.generate(
                  pagesData.length,
                  (index) => PageViews(
                    pageViewsModel: pagesData[index],
                    horizontalPadding: index == 0 ? 70.w : 55.w,
                  ),
                )
              ],
            ),
          ),
         GlobalButton(onTap: (){},
             title: "proceed",
             horizontalPadding: 16,
             pixels: 53,
         colors: AppColors.c_53b175,),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
