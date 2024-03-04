import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import '../../../models/task_model/task_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../../widgets/universal_textfield.dart';
import '../../task_details/dialog/category_diolog.dart';
import '../../task_details/dialog/priority_diolog.dart';
import '../../task_details/widgets/showtoast.dart';

updateTaskDialog({
  required BuildContext context,
  required TaskModel task,
  required ValueChanged<TaskModel> taskModelChanged,
}) {
  TaskModel taskModel = task;

  final TextEditingController titleController =
      TextEditingController(text: taskModel.title);
  final TextEditingController descriptionController =
      TextEditingController(text: taskModel.description);

  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  // int category = 0;
  int priority = 1;
  String category = "home"; // Initialize category variable here

  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              30.getH(),
              UniversalTextField(
                hintText: "eg.enter changed title",
                onChanged: (v) {
                  setState(() {
                    taskModel = taskModel.copyWith(title: v);
                  });
                },
                onSubmit: (value) {},
                controller: titleController,
                errorText: "Enter task",
                type: TextInputType.name,
                isVisible: true,
              ),
              15.getH(),
              UniversalTextField(
                hintText: "eg.enter changed description",
                onChanged: (value) {
                  setState(() {
                    taskModel = taskModel.copyWith(description: value);
                  });
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
                          category: category as String,
                        );
                        if (selectedCategory != null) {
                          setState(() {
                            category =
                                selectedCategory; // Update the category variable
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
                          currentDate: DateTime.now(),
                        );
                        if (dateTime != null) {
                          setState(() {
                            taskModelChanged(
                                taskModel.copyWith(deadline: dateTime));
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
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child!,
                            );
                          },
                        );

                        if (timeOfDay != null) {
                          DateTime d = taskModel.deadline.copyWith(
                            hour: timeOfDay!.hour,
                            minute: timeOfDay!.minute,
                          );

                          setState(() {
                            taskModel = taskModel.copyWith(deadline: d);
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
                      "${taskModel.deadline.hour} :${taskModel.deadline.minute} minute",
                      style: AppTextStyle.GilroyMedium.copyWith(
                          color: AppColors.black),
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
              if (dateTime != null)
                Row(
                  children: [
                    const Text("Category"),
                    SizedBox(width: 30.w),
                    Text(
                      "${taskModel.category.name} :$category}",
                      style: AppTextStyle.GilroyMedium.copyWith(
                          color: AppColors.black),
                    ),
                  ],
                ),
              if (dateTime != null)
                Row(
                  children: [
                    const Text("priority"),
                    SizedBox(width: 30.w),
                    Text(
                      "${taskModel.priority} :${taskModel.priority} ${taskModel.title} ${taskModel.description} ",
                      style: AppTextStyle.GilroyMedium.copyWith(
                          color: AppColors.black),
                    ),
                  ],
                ),
            ],
          ),
        );
      });
    },
  );
}
