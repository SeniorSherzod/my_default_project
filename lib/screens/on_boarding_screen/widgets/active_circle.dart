import 'package:flutter/material.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';

import '../../../utils/colors/app_colors.dart';
import '../models/page_views_model.dart';
class BoardingBottomView extends StatelessWidget {
  const BoardingBottomView(
      {super.key,
        required this.pagesData,
        required this.activeIndex,
        required this.onTap});

  final List<PageViewsModel> pagesData;
  final int activeIndex;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              ...List.generate(
                  pagesData.length,
                      (index) => Container(
                    margin: const EdgeInsets.all(4),
                    height: 7,
                   width :index == activeIndex?16:7 ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: index == activeIndex
                          ? AppColors.c_1A72DD
                          : Colors.grey,
                    ),
                  ))
            ],
          ),
        ],

      ),
    );
  }
}
