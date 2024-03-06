import 'package:adaptive_theme/adaptive_theme.dart';
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
   bool isDark = false;

   _init() async {
     isDark = await AdaptiveTheme.getThemeMode() == AdaptiveThemeMode.dark;
     setState(() {});
   }
  TaskModel taskModel =TaskModel.initialValue;
  @override
  void initState() {
    _init();
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
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                subtitle: Text(
                  "Best platform for creating to-do list",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing:  Switch(
                  value: isDark,
                  onChanged: (v) async {
                    if (v) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                    isDark = v;
                    setState(() {

                    });
                  },
                ),
            ),
            Container(
              margin:const EdgeInsets.all(10),
              width: double.infinity,
              height: 180.h,
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primaryContainer,
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
                          style: Theme.of(context).iconButtonTheme.style,
                        ),
                        Text(
                          "Tap plus create new task",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add your task",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "Today is $formattedDate",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
            ),
        ),
      );
  }
}
