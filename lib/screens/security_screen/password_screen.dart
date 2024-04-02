import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/screens/security_screen/widgets/button_num.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import '../../data/cubits/digits/digit_state.dart';
import '../../data/cubits/digits/digits_button.dart';
import '../../utils/styles/app_text_style.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light),
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: BlocProvider(
            create: (context) => PasswordCubit(),
            child: BlocBuilder<PasswordCubit, PasswordState>(
                builder: (BuildContext context, PasswordState state) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 190.h,
                      ),
                      Center(
                        child: Text(
                          "Security",
                          style: AppTextStyle.GilroyMedium.copyWith(
                              color: AppColors.white,
                              fontSize: 18.w,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Text(
                          "Enter your Passcode",
                          style: AppTextStyle.GilroyThin.copyWith(
                              color: AppColors.white,
                              fontSize: 18.w,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              4,
                                  (index) => Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration:
                                  BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index < state.password.length
                                        ? state.isTruePassword
                                        ? Colors.red
                                        : Colors.green
                                        : Colors.white10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50.h, right: 20.w, left: 20.w),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .insertValue(context, "1");
                                }, text: "1"),
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .insertValue(context, "2");
                                }, text: "2"),
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .insertValue(context, "3");
                                }, text: "3"),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .insertValue(context, "4");
                                }, text: "4"),
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .insertValue(context, "5");
                                }, text: "5"),
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .insertValue(context, "6");
                                }, text: "6"),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .insertValue(context, "7");
                                }, text: "7"),
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .insertValue(context, "8");
                                }, text: "8"),
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .insertValue(context, "9");
                                }, text: "9"),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .insertValue(context, "0");
                                }, text: ">"),
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .remove();
                                }, text: "0"),
                                NumberButton(onTap: () {
                                  context
                                      .read<PasswordCubit>()
                                      .remove();
                                }, text: "del"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ));
  }}