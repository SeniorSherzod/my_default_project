import 'package:flutter/material.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';

import '../../utils/images/app_images.dart';

class SetTimer extends StatelessWidget {
  const SetTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Timer"),
        actions: [ SizedBox(
          width: 40,
          height: 40,
          child: Image.asset(AppImages.img),
        ),],
      ),
      body: Column(
        children: [
            Center(
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.c_7C7C7C.withOpacity(0.4)

                ),
              ),
            )
        ],
      ),
    );
  }
}
