import 'package:flutter/material.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:Container(
              width: double.infinity,
              height: 250.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.c_a7a9be,
              ),
            ),
          ),

          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            elevation: 0,
            backgroundColor: AppColors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              IconButton(
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.white,
                  elevation: 20,
                ),
                onPressed: () {},
                color: Colors.black,
                icon: const Icon(Icons.more_horiz),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.white,
                  elevation: 20,
                ),
                onPressed: () {},
                color: Colors.black,
                icon: const Icon(Icons.more_horiz),
              ),
            ],
            ),
          )
        ],
      ),
    );
  }
}
