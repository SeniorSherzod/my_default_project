import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_default_project/screens/widgets/drawer.dart';

import '../utils/images/app_images.dart';
import '../utils/styles/app_text_style.dart';

class TechScillsScreens extends StatelessWidget {
  const TechScillsScreens({super.key});

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
        title: Text("Applications",style: AppTextStyle.GilroyMedium,),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.pdf),
          ),
        ],
      ),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
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
                  color: Colors.tealAccent
              ),
              child: ListTile(
                leading: Icon(Icons.note_add_outlined),
                title: Text("Todo"),
                subtitle: Column(children: [
                  Text("Todo app",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25),),
                  Text("for creating daily task",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20),),
                  Text("2024",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 18),),

                ],),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.tealAccent
              ),
              child: ListTile(
                leading: Icon(Icons.note_add_outlined),
                title: Text("Quiz App"),
                subtitle: Column(children: [
                  Text("Quiz app",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25),),
                  Text("quiz app for using different type of subject",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20),),
                  Text("2024",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 18),),

                ],),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.tealAccent
              ),
              child: ListTile(
                leading: Icon(Icons.note_add_outlined),
                title: Text("Wheather app"),
                subtitle: Column(children: [
                  Text("Wheatehr app",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25),),
                  Text("wheather app to know about wheather information your current situation",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 18),),
                  Text("present",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 18),),

                ],),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.tealAccent
              ),
              child: ListTile(
                leading: Icon(Icons.note_add_outlined),
                title: Text("Qr code app"),
                subtitle: Column(children: [
                  Text("qr code app",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25),),
                  Text("qr code app to create new qr code for text",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 18),),
                  Text("present",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 18),),

                ],),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.tealAccent
              ),
              child: ListTile(
                leading: Icon(Icons.note_add_outlined),
                title: Text("word image app"),
                subtitle: Column(children: [
                  Text("four image app",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 25),),
                  Text("four image app to know about wheather information your current situation",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 18),),
                  Text("present",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 18),),

                ],),
              ),
            ),
            SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}