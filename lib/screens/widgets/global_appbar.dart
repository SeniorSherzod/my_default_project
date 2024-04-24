import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/utils/images/app_images.dart';

class GlobalAppbar extends StatelessWidget {
  const GlobalAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(AppImages.menu),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.pdf),
        ),
      ],
    );
  }
}
