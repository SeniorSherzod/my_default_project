import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/screens/academic.dart';
import 'package:my_default_project/screens/contact.dart';
import 'package:my_default_project/screens/languages.dart';
import 'package:my_default_project/screens/summary_screen.dart';
import 'package:my_default_project/screens/tech_scills.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

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
      const SummaryScreens(),
      const AcademicScreens(),
      const TechScillsScreens(),
      const  LanguagesScreen(),
      const  ContactScreens()
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
        backgroundColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor:Colors.white,
        unselectedLabelStyle: AppTextStyle.GilroyMedium,
        selectedLabelStyle: AppTextStyle.GilroyMedium,
        selectedItemColor: Colors.tealAccent,
        items:  [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.first,),
            icon:SvgPicture.asset(AppImages.first),
            label: "Summary",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.study,),
            icon:SvgPicture.asset(AppImages.study),
            label: "Academic",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.experience,),
            icon:SvgPicture.asset(AppImages.experience),
            label: "Experience",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.language,),
            icon:SvgPicture.asset(AppImages.language),
            label: "Technology",
          ),  BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.contact,),
            icon:SvgPicture.asset(AppImages.contact),
            label: "Languages",
          ),
        ],
      ),
    );
  }
}