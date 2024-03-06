import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/colors/app_colors.dart';
import '../utils/styles/app_text_style.dart';
class UniversalTextField extends StatelessWidget {
   UniversalTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.onSubmit,
    this.keyboardType,
    this.prefix,
    required this.controller,
    required this.errorText,
    required this.type,
    this.labelText,
    required this.isVisible
  });


  final String hintText;
  final TextInputType? keyboardType;
  final Function(String value)onChanged;
  final Function(String v) onSubmit;
  final SvgPicture? prefix;
  final TextEditingController controller;
  final String errorText;
  final TextInputType type;
  final String? labelText;
  final bool? isVisible;
  final FocusNode focusNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            maxLines: null,
            textInputAction: TextInputAction.done,
            focusNode: focusNode,
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            obscureText: !isVisible!,
            decoration: InputDecoration(
              fillColor: Theme.of(context).cardColor,
              filled: true,
              hintText: hintText,
              suffix: prefix,
              helperStyle: Theme.of(context).textTheme.bodyLarge,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.main
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1,
                    color: AppColors.main
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.white,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.white,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        )

      ],
    );
  }


}