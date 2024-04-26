import 'package:flutter/material.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';

class ChatItems extends StatelessWidget {
  const ChatItems({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      width: 56.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.w),
              color: Colors.cyan,
              border: Border.all(
                width: 2.w,
                color: const Color(0xFFD84D4D),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.w),
              child: Image.network(
                image,
                width: 48.w,
                height: 48.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          4.getH(),
          Text(
            textAlign: TextAlign.center,
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFF0F1828),
              fontSize: 10.w,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}