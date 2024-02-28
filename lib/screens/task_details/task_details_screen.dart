import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/screens/task_details/diolog/task_title_diolog.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

class TaskDetailsScreens extends StatefulWidget {
  const TaskDetailsScreens({super.key});

  @override
  State<TaskDetailsScreens> createState() => _TaskDetailsScreensState();
}

class _TaskDetailsScreensState extends State<TaskDetailsScreens> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            50.getH(),
            ListTile(
                title: Text(
                  "Today",
                  style: AppTextStyle.GilroyBold.copyWith(fontSize: 30.w),
                ),
                subtitle: Text(
                  "Best platfhorm for creating to-do list",
                  style: AppTextStyle.GilroyLight.copyWith(fontSize: 15.w),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                )
            ),
            30.getH(),
            Container(
                margin:const EdgeInsets.all(10),
                width: double.infinity,
                height: 180.h,
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                  color: AppColors.main.withOpacity(0.2),
                ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                      showTaskDialog(context: context);
                      },
                          icon: SvgPicture.asset(AppImages.plus),
                      ),
                      Text(
                        "Tap plus create new task",
                        style: AppTextStyle.GilroyBold.copyWith(fontSize: 20.w),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add your task",
                        style: AppTextStyle.GilroyBold.copyWith(fontSize: 15.w),
                      ),
                      Text(
                        "Today Mon.20.Jul.2024",
                        style: AppTextStyle.GilroyBold.copyWith(fontSize: 15.w),
                      ),
                    ],
                  )
                ],
                ),
              ),
            )


          ]
        ),
      ),
    );
  }
}
