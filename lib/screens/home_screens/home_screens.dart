import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_default_project/screens/home_screens/widgets/drawer.dart';
import 'package:my_default_project/utils/images/app_images.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  bool isDark = false;

  get pageController => null;

  _init() async {
    isDark = await AdaptiveTheme.getThemeMode() == AdaptiveThemeMode.dark;
    setState(() {});
  }
  @override
  void initState() {
    _init();
    super.initState();
  }
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: MyDrawer(switcher: Switch(
        value: isDark,
        onChanged: (v) async {
      if (v) {
        AdaptiveTheme.of(context).setDark();
        Navigator.pop(context);
      } else {
        AdaptiveTheme.of(context).setLight();
        Navigator.pop(context);
      }
      isDark = v;
      setState(() {
      });
        })),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
            //Scaffold.of(context).openDrawer();
          },
          icon: SvgPicture.asset(AppImages.menu,color: Theme.of(context).iconTheme.color),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // scaffoldKey.currentState!.openDrawer();
              //Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(AppImages.search,color: Theme.of(context).iconTheme.color),
          ),
          IconButton(
            onPressed: () {
              // scaffoldKey.currentState!.openDrawer();
              //Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(AppImages.like,color:Theme.of(context).iconTheme.color),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("your_fovourite".tr(),style:Theme.of(context).textTheme.displaySmall),


          ],
        ),
      ),
    );
  }
}
