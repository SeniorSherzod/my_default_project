import 'package:flutter/material.dart';
import 'package:my_default_project/screens/category/category_screen.dart';
import 'package:my_default_project/screens/inbox/inbox_screen.dart';
import 'package:my_default_project/screens/on_boarding_screen/on_boarding.dart';
import 'package:my_default_project/screens/project/instruction_screen.dart';
import 'package:my_default_project/screens/project/project_screen.dart';
import 'package:my_default_project/screens/project/try_board.dart';
import 'package:my_default_project/screens/splash_screen/splash_screen.dart';
import 'package:my_default_project/screens/tab/home_screens/home_screens.dart';
import 'package:my_default_project/screens/tab/tab_box/bottmo_navigator.dart';
import 'package:my_default_project/screens/task_details/add_category.dart';
import 'package:my_default_project/screens/task_details/task_details_screen.dart';
import 'package:my_default_project/screens/task_details/widgets/slider_avatar.dart';
//
class AppRoutes {
  static Route  generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.helloScreen:
        return navigate( const HomeScreen());

      case RouteNames.splashScreen:
        return navigate(const SplashScreen());

      case RouteNames.onboardingScreen:
        return navigate(const OnBoardingScreen(),);

      case RouteNames.taskScreen:
        return navigate(const TaskDetailsScreens(),);

      case RouteNames.inboxScreen:
        return navigate(const InboxScreen(),);

      case RouteNames.projectScreen:
        return navigate(const ProjectScreen(),);

      case RouteNames.categoryScreen:
        return navigate(const CategoryScreen(),);

      case RouteNames.tryBoardScreen:
        return navigate(const TryBoardScreen(),);

      case RouteNames.instructionScreen:
        return navigate(const InstructionScreen(),);
      // case RouteNames.sliderScreen:
      //   return navigate(SliderAvatar(onItemClick: o),);

      case RouteNames.addCategoryScreen:
        return navigate( AddCategoryScreen(onCategoryAdded: settings.arguments as VoidCallback?,),);

      case RouteNames.bottomNavigator:
        return navigate(const BottomNavigatorScreen(),);


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
  static const String tryBoardScreen = "/tryBoard_route";
  static const String instructionScreen = "/instruction_route";
  static const String addCategoryScreen = "/addCategory_route";
  static const String sliderScreen = "/slider_route";
  static const String bottomNavigator = "/bottom_route";

}
