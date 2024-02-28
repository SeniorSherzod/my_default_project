import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:my_default_project/widgets/universal_textfield.dart';




showTaskDialog({required BuildContext context}) {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            children: [
              30.getH(),
              UniversalTextField(
                  hintText: "eg.enter task",
                  onChanged: (value){},
                  onSubmit: (v){},
                  controller: taskController,
                  errorText: "Enter task",
                  type: TextInputType.name,
                  isVisible:true ),
              15.getH(),
              UniversalTextField(
                  hintText: "eg.enter description",
                  onChanged: (value){},
                  onSubmit: (v){},
                  controller: taskController,
                  errorText: "Enter description",
                  type: TextInputType.name,
                  isVisible:true ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    IconButton(onPressed: (){},
                        icon: SvgPicture.asset(AppImages.task),
                    ),
                    IconButton(onPressed: (){},
                      icon: SvgPicture.asset(AppImages.date),
                    ),
                    IconButton(onPressed: (){},
                      icon: SvgPicture.asset(AppImages.clock),
                    ),
                    IconButton(onPressed: (){},
                      icon: SvgPicture.asset(AppImages.flag),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      });
}
