
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class GuessWordController extends GetxController {
  RxString currentQuestion = ''.obs;
  RxString targetWord = ''.obs;
  RxString enteredWord = ''.obs;
  RxInt attempts = 10.obs; // Number of attempts
  RxInt trueScore = 0.obs; // True score
  RxInt falseScore = 0.obs; // False score

  final List<Map<String, String>> quizData = [
    {'question': 'Ko`kda ko`rdim ko`prik,\nRangi – yeti turlik.\n(Kamalak)', 'answer': 'Kamalak'},
    {'question': 'Cho`zilib yotar Narvon,\nUndan o`tar uy- karvon.\n(Poyezd yo`li)', 'answer': 'Poyezd yo`li'},
    {'question': 'Yuk ko`tarar burnida\nUy qurish bor bo`ynida.\n(Quruvchi kran)', 'answer': 'Quruvchi kran'},
    {'question': 'Uzoqdan boqdim: bir qora tosh,\nYoniga borsam, to`rt oyoq, bir bosh.\n(Toshbaqa)', 'answer': 'Toshbaqa'},
    {'question': 'Hech ham tinim bilmaydi,\nLek joyidan jilmaydi.\n(Soat)', 'answer': 'Soat'},
    {'question': 'Yorug`i bor, dovrug`i bor,\nIzi yo`q, ovozi bor.\n(Momaqaldiroq)', 'answer': 'Momaqaldiroq'},
    {'question': 'Safda o`n ikki askar,\nBo`yu basti barobar.\nYo`nsang yog`och po`stini,\nRasmlarga rang berar.\n(Qalamlar)', 'answer': 'Qalamlar'},
    {'question': 'Borar bir, kelar bir,\nBaribir qo`shig`i: “g`ir – g`ir…”\n(Arra)', 'answer': 'Arra'},
    {'question': 'O`rtog`im – ruchka, qalam,\nBir chiziq, katak – dalam.\n(Daftar)', 'answer': 'Daftar'},
    {'question': 'Boylasam yuradi,\nYechsam to`xtaydi.\n(Poyafzal)', 'answer': 'Poyafzal'},
  ];

  get isCorrect => true;


  @override
  void onInit() {
    super.onInit();
    generateQuestion();
  }

  void generateQuestion() {
    final Random random = Random();
    final int index = random.nextInt(quizData.length);
    final Map<String, String> questionData = quizData[index];
    currentQuestion.value = questionData['question']!;
    targetWord.value = questionData['answer']!;
    enteredWord.value = '';
    attempts.value = 10; // Reset attempts
  }

  void addToEnteredWord(String letter) {
    if (enteredWord.value.length < targetWord.value.length && attempts.value > 0) {
      enteredWord.value += letter;
    }
  }

  void removeFromEnteredWord() {
    if (enteredWord.value.isNotEmpty && attempts.value > 0) {
      enteredWord.value = enteredWord.value.substring(0, enteredWord.value.length - 1);
    }
  }

  void checkAnswer() {
    final String guessValue = enteredWord.value.trim().toLowerCase();
    final String targetValue = targetWord.value.trim().toLowerCase();
    print('Guess value: $guessValue');
    print('Target value: $targetValue');
    if (guessValue == targetValue) {
      trueScore.value++; // Increment true score
      showResultDialog(true, trueScore.value, falseScore.value);
    } else {
      falseScore.value++; // Increment false score
      attempts.value--; // Decrement attempts
      if (attempts.value == 0) {
        showResultDialog(false, trueScore.value, falseScore.value);
      }
    }
  }


  void showResultDialog(bool isCorrect, int trueScore, int falseScore) {
    Get.defaultDialog(
      title: isCorrect ? 'Correct!' : 'Incorrect!',
      middleText: isCorrect ? 'You guessed it right!' : 'Sorry, wrong answer!',
      actions: [
        ElevatedButton(
          onPressed: () => Get.back(),
          child: Text('OK'),
        ),
      ],
    );
  }

}
