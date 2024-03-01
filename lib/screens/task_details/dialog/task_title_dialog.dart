import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:my_default_project/screens/task_details/dialog/priority_diolog.dart';
import 'package:my_default_project/screens/task_details/widgets/showtoast.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';
import 'package:my_default_project/widgets/universal_textfield.dart';
import '../../../models/task_model/task_model.dart';
import 'category_diolog.dart';

showTaskDialog({
  required BuildContext context,
  required ValueChanged<TaskModel> taskModelCallback,
  required Null Function(dynamic task) taskModel,
}) {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  //
  int priority;
  String category = "home"; // Initialize category variable here
  TaskModel taskModel = TaskModel.initialValue;

  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              30.getH(),
              UniversalTextField(
                hintText: "eg.enter task",
                onChanged: (v) {
                  taskModelCallback(taskModel.copyWith(title: v));
                },
                onSubmit: (value) {},
                controller: taskController,
                errorText: "Enter task",
                type: TextInputType.name,
                isVisible: true,
              ),
              15.getH(),
              UniversalTextField(
                hintText: "eg.enter description",
                onChanged: (value) {
                  taskModelCallback(taskModel.copyWith(description: value));
                },
                onSubmit: (v) {},
                controller: descriptionController,
                errorText: "Enter description",
                type: TextInputType.name,
                isVisible: true,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final selectedCategory = await showCategory(
                          context: context,
                          category: category,
                        );
                        if (selectedCategory != null) {
                          setState(() {
                            category = selectedCategory; // Update the category variable
                          });
                        }
                      },
                      icon: SvgPicture.asset(AppImages.task),
                    ),

                    IconButton(
                      onPressed: () async {
                        dateTime = await showDatePicker(
                          context: context,
                          cancelText: "cancel",
                          confirmText: "select",
                          barrierDismissible: false,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2030),
                          currentDate: DateTime(2024),
                        );
                        if (dateTime != null) {
                          setState((){
                            taskModelCallback(taskModel.copyWith(deadline: dateTime));
                          });
                        }
                      },
                      icon: SvgPicture.asset(AppImages.date),
                    ),
                    IconButton(
                      onPressed: () async {
                        timeOfDay = await showTimePicker(
                          context: context,
                          initialEntryMode: TimePickerEntryMode.input,
                          initialTime: const TimeOfDay(hour: 08, minute: 00),
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true), // Set alwaysUse24HourFormat to true
                              child: child!,
                            );
                          },
                        );
                        if (timeOfDay != null) {
                          DateTime d = taskModel.deadline;
                          d = d.copyWith(
                            hour: timeOfDay!.hour,
                            minute: timeOfDay!.minute,
                          );
                          setState((){
                            taskModelCallback(taskModel.copyWith(deadline: d));
                          });
                        }
                      },
                      icon: SvgPicture.asset(AppImages.clock),
                    ),

                    IconButton(
                      onPressed: () {
                        showPriority(
                          p: taskModel.priority,
                          context: context,
                          priority: (p) {
                            setState(() {
                              priority = p;
                              taskModel = taskModel.copyWith(priority: p);
                              if (taskModel.canAddTaskToDatabase()) {
                                showToastMessage("seccess");
                                Navigator.pop(context);
                              } else {
                                showErrorToastMessage("Error");
                                Navigator.pop(context);
                              }
                            });
                          },
                        );
                      },
                      icon: SvgPicture.asset(AppImages.flag),
                    ),

                  ],
                ),
              ),
              if (dateTime != null)
                Row(
                  children: [
                    const Text("Time"),
                    SizedBox(width: 30.w),
                    Text(
                      "${taskModel.deadline.hour} :${taskModel.deadline.minute}",
                      style: AppTextStyle.GilroyMedium.copyWith(color: AppColors.black),
                    ),
                  ],
                ),
              if (dateTime != null)
                Row(
                  children: [
                    const Text("Deadline"),
                    SizedBox(width: 30.w),
                    Text(DateFormat.yMMMEd().format(dateTime!)),
                  ],
                ),
            ],
          ),
        );
      });
    },
  );
}

