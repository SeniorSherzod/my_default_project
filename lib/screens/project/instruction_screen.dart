import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../named_route.dart';

class InstructionScreen extends StatefulWidget {
  const InstructionScreen({super.key});

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.main,
        leading: IconButton(
          onPressed: (){
            Navigator.pushNamed(context, RouteNames.projectScreen);
          },
          icon: SvgPicture.asset(AppImages.back,color: AppColors.white,),
        ),
        title: Text("Instruction"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tips and Tricks   4",style: AppTextStyle.GilroyMedium.copyWith(fontSize: 30.w),),
                IconButton(
                    onPressed: (){
                      // Navigator.pushNamed(context, RouteNames.projectScreen);
                    },
                    icon: Icon(Icons.more_vert_outlined)
                ),
              ],
            ),
            Text("Use click create task",style: AppTextStyle.GilroyLight.copyWith(fontSize: 25.w)),
            Text("Start own project!",style: AppTextStyle.GilroyLight.copyWith(fontSize: 25.w)),
            Text("Organise these task",style: AppTextStyle.GilroyLight.copyWith(fontSize: 25.w)),
            Text("Scechudule task",style: AppTextStyle.GilroyLight.copyWith(fontSize: 25.w)),
          ],
        ),
      ),
    );
  }
}
