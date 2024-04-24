import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            // Handle the tap event here
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.pink1,
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                  offset: Offset(0, 3), // This controls the shadow direction (x, y)
                ),
              ],
            ),
            child: Center(child: SvgPicture.asset(AppImages.back)),
          ),
        ),
        InkWell(
          onTap: () {
            // Handle the tap event here
          },
          child: Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.pink1,
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Contact",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {

          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.pink1,
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(child: SvgPicture.asset(AppImages.forward)),
          ),
        ),





      ],
    );
  }
}
