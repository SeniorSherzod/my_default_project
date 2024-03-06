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
        automaticallyImplyLeading: false,
        title: const Text("Project"),
        // leading: IconButton(
        //   onPressed: (){
        //     Navigator.pop(context);
        //   },
        //   icon: SvgPicture.asset(AppImages.back,color: AppColors.white,),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading:const Icon(Icons.note_add_outlined),
              title: Padding(
                padding:  EdgeInsets.only(right: 170.w),
                child: TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RouteNames.tryBoardScreen);
                  },
                  child:Text("Try board",style: Theme.of(context).textTheme.bodyMedium),
                ),
              ),
              trailing:  SvgPicture.asset(AppImages.heart)
            ),
            ListTile(
                leading:const Icon(Icons.message),
                title: Padding(
                  padding:  EdgeInsets.only(right: 110.w),
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, RouteNames.instructionScreen);

                    },
                    child:Text("Instructions for use",style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
