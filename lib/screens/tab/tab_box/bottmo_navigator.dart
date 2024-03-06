import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/screens/category/category_screen.dart';
import 'package:my_default_project/screens/inbox/inbox_screen.dart';
import 'package:my_default_project/screens/project/project_screen.dart';
import 'package:my_default_project/screens/task_details/task_details_screen.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/images/app_images.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({super.key});

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorScreenState();
}

class _BottomNavigatorScreenState extends State<BottomNavigatorScreen> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      const TaskDetailsScreens(),
     const InboxScreen(),
      const CategoryScreen(),
     const  ProjectScreen()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _activeIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: Theme.of(context).colorScheme.background,
        items:  [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.home,color: Theme.of(context).colorScheme.onSurface,),
            icon:SvgPicture.asset(AppImages.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.task,color: Theme.of(context).colorScheme.onSurface,),
            icon:SvgPicture.asset(AppImages.task),
            label: "Inbox",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.date,color: Theme.of(context).colorScheme.onSurface,),
            icon:SvgPicture.asset(AppImages.date),
            label: "Upcoming",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.add,color: Theme.of(context).colorScheme.onSurface,),
            icon:SvgPicture.asset(AppImages.add),
            label: "Project",
          ),
        ],
      ),
    );
  }
}