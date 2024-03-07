import 'package:flutter/material.dart';
import 'package:my_default_project/screens/basket_screen/basket_screen.dart';
import 'package:my_default_project/screens/details_screen/details_screen.dart';
import 'package:my_default_project/screens/home_screens/home_screens.dart';
import 'package:my_default_project/screens/splash_screen/on_boarding.dart';
import 'package:my_default_project/screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static Route  generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.helloScreen:
        return navigate( const HomeScreens());

      case RouteNames.splashScreen:
        return navigate(const SplashScreen());

      case RouteNames.onboardingScreen:
        return navigate(const OnBoardingScreen(),);

      case RouteNames.basketScreen:
        return navigate(const BasketScreen(),);

      case RouteNames.detailsScreen:
        return navigate(const DetailsScreen(),);



      default:
        return navigate(
          const Scaffold(
            body: Center(

            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String helloScreen = "/";
  static const String splashScreen = "/splash_route";
  static const String onboardingScreen = "/boarding_route";
  static const String basketScreen = "/basket_route";
  static const String detailsScreen = "/details_route";

}