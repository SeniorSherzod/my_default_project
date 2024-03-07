import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../named_route.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    _init();

    super.initState();
  }

  _init() async {
    // bool isFirstTime=StorageRepository.getBool();
    Future.delayed(const Duration(seconds: 1), () {
      // if(isFirstTime){
        Navigator.pushNamed(context, RouteNames.onboardingScreen);
      // }else{
      //   Navigator.pushNamed(context, RouteNames.onboardingScreen);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_53b175,
      body: Center(
        child: Lottie.asset(AppImages.lotty),
      ),
    );
  }
}