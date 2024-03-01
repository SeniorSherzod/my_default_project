import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.main,
        title:const Text("Inbox"),
      ),
    );
  }
}
