import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/models/task_model/task_model_constant.dart';
import 'package:my_default_project/screens/task_details/dialog/models_category/category_list.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import '../../../data/local/local_datebase.dart';
import '../../../models/category_model/category_model.dart';
import '../../../models/task_model/task_model.dart';
import '../../../utils/styles/app_text_style.dart';


class TaskItemView extends StatelessWidget {
  const TaskItemView(
      {super.key,
        required this.taskModel,
        required this.onDelete,
        required this.onUpdate,
        required this.onStatusUpdate});

  final TaskModel taskModel;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;
  final VoidCallback onStatusUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.main.withOpacity(0.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskModel.title,
                style: AppTextStyle.GilroyBold.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              FutureBuilder<CategoryModel>(
                  future: LocalDatabase.getCategoryById(taskModel.category as int),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      CategoryModel category = snapshot.data as CategoryModel;
                      return Text(
                        taskModel.description,
                        style: AppTextStyle.GilroyBold.copyWith(
                          fontSize: 20,
                          color: AppColors.black,
                        ),
                      );
                    }

                    return const Center(child: Text(""));
                  })
            ],
          ),
          // Text(
          //   taskModel.category.color,
          //   style: AppTextStyle.GilroyBold.copyWith(
          //     fontSize: 20,
          //     color: AppColors.black,
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Priority ${taskModel.priority.toString()}",
                style: AppTextStyle.GilroyBold.copyWith(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: onStatusUpdate,
                child: Text(
                 "Status ${taskModel.status.name}",
                  style: AppTextStyle.GilroyBold.copyWith(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          Text(
            taskModel.deadline.toString(),
            style: AppTextStyle.GilroyBold.copyWith(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
          20.getH(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 50.h,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      backgroundColor: AppColors.main,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: BorderSide(
                        color: AppColors.main, // your color here
                        width: 1,
                      ),
                    ),
                    onPressed: onDelete,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Delete",
                            style: AppTextStyle.GilroyBold
                                .copyWith(fontSize: 17, color: AppColors.white)
                        ),
                        Icon(
                          Icons.delete,
                          color:AppColors.c_F4261A,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.getW(),
              Expanded(
                child: Container(
                  height: 50.h,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      backgroundColor: AppColors.main,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: BorderSide(
                        color: AppColors.main, // your color here
                        width: 1,
                      ),
                    ),
                    onPressed: onUpdate,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Edit",
                            style: AppTextStyle.GilroyBold
                                .copyWith(fontSize: 17, color: AppColors.white)
                        ),
                        Icon(
                          Icons.edit,
                          color:AppColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              10.getW(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:AppColors.main,
                  ),
                  child: Row(children: [
                    Text("Category"),
                    SvgPicture.asset( taskModel.category.iconPath),
                  ],),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}