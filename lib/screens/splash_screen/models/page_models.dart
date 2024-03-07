import 'package:flutter/material.dart';
import 'package:my_default_project/screens/splash_screen/models/page_view.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
class PageViews extends StatelessWidget {
  const PageViews({super.key,
    required this.pageViewsModel,
    required this.horizontalPadding});

  final PageViewsModel pageViewsModel;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(pageViewsModel.iconPath),
          SizedBox(height: 50.h),
          Text(
            pageViewsModel.title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall
          ),
        ],
      ),
    );
  }
}
