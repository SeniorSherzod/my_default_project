import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_default_project/screens/splash_screen.dart';
import 'package:my_default_project/screens/widgets/bottom_button.dart';
import 'package:my_default_project/screens/widgets/drawer.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

import '../utils/colors/app_colors.dart';
import '../utils/images/app_images.dart';

class SummaryScreens extends StatelessWidget {
  const SummaryScreens({super.key});

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
        title: Text("Summary",style: AppTextStyle.GilroyMedium,),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.pdf),
          ),
        ],
      ),
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Icon(Icons.laptop_chromebook_outlined,size: 70,color: Colors.cyan,),
              Text("Plivent",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 30),),
              Text("Plenty of skills around communication, media, web and advertising."),
              SizedBox(height: 10,),
              Icon(Icons.work_history_outlined,size: 70,color: Colors.cyan,),
              Text("Experience",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 30),),
              Text("More than 10 years working in design fields, with Adobe Creative Suite, Figma and collaborative tools.."),
              SizedBox(height: 10,),
              Icon(Icons.work_history_outlined,size: 70,color: Colors.cyan,),
              Text("Experience",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 30),),
              Text("More than 10 years working in design fields, with Adobe Creative Suite, Figma and collaborative tools.."),
              SizedBox(height: 10,),
              Icon(Icons.messenger_outline,size: 70,color: Colors.cyan,),
              Text("Open Minded",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 30),),
              Text("Always looking for the continuous improvement and ready to learn about the newest."),
              SizedBox(height: 10,),
             SizedBox(
                 width:100,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(40),
                     child: Image.asset(AppImages.men))),
              Text("Emphatic & Humble",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 30),),
              Text("I try to be active"),
              SizedBox(height: 90,),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ResumeScreen()));
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.pink1,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7,
                    offset: Offset(0, 3), // This controls the shadow direction (x, y)
                  ),
                ],
              ),
              child: Center(child: SvgPicture.asset(AppImages.back)),
            ),
          ),
          InkWell(
            onTap: () {
              // Handle the tap event here
            },
            child: Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.pink1,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Contact",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {

            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.pink1,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(child: SvgPicture.asset(AppImages.forward)),
            ),
          ),





        ],
      ),
    );
  }
}