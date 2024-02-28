import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/widgets/global_button.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../named_route.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: AppColors.transparent
      ),
      child: Scaffold(
        backgroundColor: AppColors.main,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logo),
            Text(
              "To do app",
              style: AppTextStyle.GilroyBold.copyWith(
                fontSize: 38.w,
                color: AppColors.white,
              ),
            ),
            Text(
              "The best app to do lists for you",
              style: AppTextStyle.GilroyBold.copyWith(
                fontSize: 18.w,
                color: AppColors.white,
              ),
            ),
            100.getH(),
            GlobalButton(onTap: (){
              Navigator.pushReplacementNamed(context, RouteNames.onboardingScreen,);
            },
                title: "Lets go",
              colorText: AppColors.white,
                horizontalPadding: 16.w,
                pixels: 60,
            colors: AppColors.c_53b175,)
          ],
        ),

      ),
    );
  }
}