import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/colors/app_colors.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
        backgroundColor: AppColors.main,
       centerTitle: true,
        title:const Text("Upcaming"),
      ),
    );
  }
}
