import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_default_project/screens/widgets/drawer.dart';

import '../utils/images/app_images.dart';
import '../utils/styles/app_text_style.dart';

class ContactScreens extends StatelessWidget {
  const ContactScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: SvgPicture.asset(AppImages.menu),
        ),
        title: Text("Language",style: AppTextStyle.GilroyMedium,),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.pdf),
          ),
        ],
      ),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading: SvgPicture.asset(AppImages.us),
              title: Text("English",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25),),
            ),ListTile(
              leading: SvgPicture.asset(AppImages.ru),
              title: Text("Russian",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25),),
            ),ListTile(
              leading: SvgPicture.asset(AppImages.uz),
              title: Text("Uzbek",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25),),
            ),
          ],
        ),
      ),
    );
  }
}