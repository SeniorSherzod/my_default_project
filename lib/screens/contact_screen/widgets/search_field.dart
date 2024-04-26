import 'package:flutter/material.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';

class SearchFieldLogic extends StatelessWidget {
  const SearchFieldLogic({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xFFADB5BD),
            ),
            hintText: "Search",
            hintStyle: TextStyle(
              color: const Color(0xFFADB5BD),
              fontSize: 14.w,
              fontWeight: FontWeight.w600,
            ),
            filled: true,
            fillColor: const Color(0xFFF7F7FC),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.w),
              borderSide: BorderSide(
                width: 0.w,
                color: const Color(0xFFF7F7FC),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.w),
              borderSide: BorderSide(
                width: 0.w,
                color: const Color(0xFFF7F7FC),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
