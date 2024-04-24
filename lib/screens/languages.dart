import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_default_project/screens/widgets/drawer.dart';

import '../utils/images/app_images.dart';
import '../utils/styles/app_text_style.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: SvgPicture.asset(AppImages.menu),
        ),
        title: Text("Scills",style: AppTextStyle.GilroyMedium,),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                  child: SvgPicture.asset(AppImages.html)),
              Text("Html",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20),)
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
                  child: SvgPicture.asset(AppImages.java)),
              Text("Html",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20),)
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
                  child: SvgPicture.asset(AppImages.vscode)),
              Text("Html",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20),)
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
                  child: SvgPicture.asset(AppImages.figma)),
              Text("Html",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20),)
            ],
          )
        ],

        ),
      ),
    );
  }
}