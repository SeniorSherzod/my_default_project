import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:my_default_project/data/local/local_datebase.dart';
import 'package:my_default_project/models/task_model/task_model.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

import 'dialog/task_title_dialog.dart';

class TaskDetailsScreens extends StatefulWidget {
  const TaskDetailsScreens({super.key});

  @override
  State<TaskDetailsScreens> createState() => _TaskDetailsScreensState();
}

class _TaskDetailsScreensState extends State<TaskDetailsScreens> {

   DateTime? dateTime;

  TaskModel taskModel =TaskModel.initialValue;
  @override
  void initState() {
   taskModel.canAddTaskToDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('d MMM yyyy');
    String formattedDate = formatter.format(now);
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            50.getH(),
            ListTile(
                title: Text(
                  "Today",
                  style: AppTextStyle.GilroyBold.copyWith(fontSize: 30.w),
                ),
                subtitle: Text(
                  "Best platform for creating to-do list",
                  style: AppTextStyle.GilroyLight.copyWith(fontSize: 15.w),
                ),
                // trailing: IconButton(
                //   onPressed: () {},
                //   icon: const Icon(Icons.settings),
                // )
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
                        showTaskDialog(context: context,taskModel: (task){
                          taskModel=task;
                        }, taskModelCallback: (task) {
                          LocalDatabase.insertTask(taskModel);
                        });
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
                        "Today is $formattedDate",
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
