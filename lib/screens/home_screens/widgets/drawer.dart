import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/utils/images/app_images.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required this.switcher});

  final Widget switcher;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Column(
          children: [
           SvgPicture.asset(AppImages.basket,),
            TextButton(
              onPressed: () {

                Navigator.pop(context);
              },
              child: const Text("My Basket"),
            ),
            TextButton(
              onPressed: () {

              },
              child: Row(
                children: [
                  switcher,
                  const  Text("Switch theme")
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                context.setLocale(const Locale("uz", "UZ"));
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Text("Uzbek"),const SizedBox(width: 10,),
                  SvgPicture.asset(AppImages.uzflag,width: 30,)
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                context.setLocale(const Locale("en", "EN"));
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Text("English"),
                  const SizedBox(width: 10,),
                  SvgPicture.asset(AppImages.usflag,width: 30,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
