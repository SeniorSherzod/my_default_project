import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:my_default_project/data/models/network_responce.dart';
import 'package:my_default_project/data/models/product/product.dart';
import 'package:my_default_project/data/repository/product_repository.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

class DetailsScreens extends StatefulWidget {
  const DetailsScreens(
      {super.key, required this.img, required this.name, required this.description});

  final String img;
  final String name;
  final String description;

  @override
  State<DetailsScreens> createState() => _DetailsScreensState();
}

class _DetailsScreensState extends State<DetailsScreens> {

  final ProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Description"),
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: AppColors.transparent
          ),
        ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(widget.name,style: AppTextStyle.GilroyMedium.copyWith(fontSize: 20),),
          Expanded(
            child: Image.network(
                widget.img
            ),
          ),
          Expanded(child: Text(widget.description,
              style: AppTextStyle.GilroyLight.copyWith
                (fontSize: 20,fontWeight:FontWeight.w200))),
        ],
      ),
    ),


    );
  }
}
