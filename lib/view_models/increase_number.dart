import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class NumberViewModel extends ChangeNotifier {
  NumberViewModel(){
  updateNUm();
}

int counter = 0;

  updateNUm()async {
    while (100<=1) {
    await Future.delayed(const Duration(seconds: 1));
     counter--;
      notifyListeners();
    }
  }
}