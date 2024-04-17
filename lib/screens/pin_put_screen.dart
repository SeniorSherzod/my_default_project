import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:pinput/pinput.dart';
import 'guess_screens/word_controller.dart';

class PinPutScreen extends StatelessWidget {
  final GuessWordController controller = Get.put(GuessWordController());

  PinPutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 32,
      height: 32,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrangeAccent),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: Colors.green),
        shape: BoxShape.circle,
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Image.asset(AppImages.nature, width: double.infinity, height: MediaQuery.of(context).size.height, fit: BoxFit.cover),
          Positioned(
            top: 220,
            left: 20,
            right: 20,
            child: Obx(() {
              if (controller.enteredWord.value.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.currentQuestion.value,
                      style: TextStyle(fontSize: 22.0, color: AppColors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }

              return SizedBox();
            }),
          ),
          Positioned(
            top: 460,
            left: 15,
            right: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      for (final letter in controller.targetWord.value.split('')..shuffle())
                        ElevatedButton(
                          onPressed: () {
                            controller.addToEnteredWord(letter);
                          },
                          child: Text(letter.toUpperCase()),
                        ),
                    ],
                  );
                }),
                SizedBox(height: 20),
                Obx(() {
                  return Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    length: controller.targetWord.value.length,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    controller: TextEditingController(text: controller.enteredWord.value),
                    keyboardType: TextInputType.text,
                  );
                }),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.generateQuestion();
                      },
                      child: Text('Next Question'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        controller.checkAnswer();
                      },
                      child: Text('Ckeck Result'),
                    ),



                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
