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
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
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
                Text("Tips and Tricks   4",style: Theme.of(context).textTheme.headlineLarge,),
                IconButton(
                    onPressed: (){
                      // Navigator.pushNamed(context, RouteNames.projectScreen);
                    },
                    icon: Icon(Icons.more_vert_outlined)
                ),
              ],
            ),
            Text("Use click create task",style: Theme.of(context).textTheme.headlineLarge,),
            Text("Start own project!",style: Theme.of(context).textTheme.headlineLarge,),
            Text("Organise these task",style: Theme.of(context).textTheme.headlineLarge,),
            Text("Scechudule task",style: Theme.of(context).textTheme.headlineLarge,),
          ],
        ),
      ),
    );
  }
}
