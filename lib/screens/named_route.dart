import 'package:flutter/material.dart';
import 'package:my_default_project/screens/category/category_screen.dart';
import 'package:my_default_project/screens/inbox/inbox_screen.dart';
import 'package:my_default_project/screens/on_boarding_screen/on_boarding.dart';
import 'package:my_default_project/screens/project/project_screen.dart';
import 'package:my_default_project/screens/splash_screen/splash_screen.dart';
import 'package:my_default_project/screens/tab/home_screens/home_screens.dart';
import 'package:my_default_project/screens/tab/tab_box/bottmo_navigator.dart';
import 'package:my_default_project/screens/task_details/task_details_screen.dart';
//
class AppRoutes {
  static Route  generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.helloScreen:
        return navigate( HomeScreen());

      case RouteNames.splashScreen:
        return navigate(SplashScreen());

      case RouteNames.onboardingScreen:
        return navigate(OnBoardingScreen(),);

      case RouteNames.taskScreen:
        return navigate(TaskDetailsScreens(),);

      case RouteNames.inboxScreen:
        return navigate(InboxScreen(),);

      case RouteNames.projectScreen:
        return navigate(ProjectScreen(),);

      case RouteNames.categoryScreen:
        return navigate(CategoryScreen(),);

      case RouteNames.bottomNavigator:
        return navigate(BottomNavigatorScreen(),);


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

// TODO Step 3
class RouteNames {
  static const String helloScreen = "/";
  static const String splashScreen = "/splash_route";
  static const String onboardingScreen = "/boarding_route";
  static const String projectScreen = "/project_route";
  static const String categoryScreen = "/category_route";
  static const String taskScreen = "/task_route";
  static const String inboxScreen = "/inbox_route";
  static const String bottomNavigator = "/bottom_route";

}
