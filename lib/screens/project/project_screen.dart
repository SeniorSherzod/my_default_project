import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/screens/named_route.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

import '../../utils/colors/app_colors.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:const SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.main,
        title: const Text("Project"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.note_add_outlined),
              title: Padding(
                padding:  EdgeInsets.only(right: 170.w),
                child: TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RouteNames.tryBoardScreen);
                  },
                  child: Text("Try board",style: AppTextStyle.GilroyLight),
                ),
              ),
              trailing:  SvgPicture.asset(AppImages.heart)
            ),
            ListTile(
                leading: Icon(Icons.message),
                title: Padding(
                  padding:  EdgeInsets.only(right: 110.w),
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, RouteNames.instructionScreen);

                    },
                    child: Text("Instractions for use",style: AppTextStyle.GilroyLight,),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
