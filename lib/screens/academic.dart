import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_default_project/screens/widgets/drawer.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

import '../utils/images/app_images.dart';

class AcademicScreens extends StatelessWidget {
  const AcademicScreens({super.key});

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: SvgPicture.asset(AppImages.menu),
        ),
        title: Text("Academic",style: AppTextStyle.GilroyMedium,),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey
              ),
              child: ListTile(
                leading: Icon(Icons.note_add_outlined),
                title: Text("Graduate"),
                subtitle: Column(children: [
                  Text("Termiz state University",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25),),
                  Text("Uzbek Philology",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20),),
                  Text("2022",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 18),),

                ],),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey
              ),
              child: ListTile(
                leading: Icon(Icons.note_add_outlined),
                title: Text("bootcamp"),
                subtitle: Column(children: [
                  Text("Najot Ta'lim",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25),),
                  Text("Bootcamp result",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20),),
                  Text("2023",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 18),),

                ],),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey
              ),
              child: ListTile(
                leading: Icon(Icons.note_add_outlined),
                title: Text("Bootcamp"),
                subtitle: Column(children: [
                  Text("Najot Ta'lim",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25),),
                  Text("Bootcamp Flutter",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20),),
                  Text("present",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 18),),

                ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
