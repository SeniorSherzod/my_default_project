import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../named_route.dart';

class TryBoardScreen extends StatefulWidget {
  const TryBoardScreen({super.key});

  @override
  State<TryBoardScreen> createState() => _TryBoardScreenState();
}

class _TryBoardScreenState extends State<TryBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppImages.back,color: AppColors.white,),
        ),
        title: Text("Try Board"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("In progress",style:Theme.of(context).textTheme.headlineLarge,),
                IconButton(
                  onPressed: (){
                    // Navigator.pushNamed(context, RouteNames.projectScreen);
                  },
                  icon: Icon(Icons.more_vert_outlined)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
