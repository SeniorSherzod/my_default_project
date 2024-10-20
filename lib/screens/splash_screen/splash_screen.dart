import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_default_project/data/local/storage_repository.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/constants/Storage_keys.dart';
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
    bool isFirstTime=StorageRepository.getBool(key: Storagekeys.onBoardingState);
    Future.delayed(const Duration(seconds: 3), () {
      if(isFirstTime){
        Navigator.pushNamed(context, RouteNames.bottomNavigator);
      }else{
        Navigator.pushNamed(context, RouteNames.bottomNavigator);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Center(
        child: Lottie.asset(AppImages.lotty),
      ),
    );
  }
}
