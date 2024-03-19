import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorViewModel extends ChangeNotifier{
  CalculatorViewModel(){
    notifyListeners();
  }
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    print(buttonText);
    result = buttonText;
    notifyListeners();
    String doesContainDecimal(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
      }
      return result;
    }

    notifyListeners();
    if (buttonText == "AC") {
      equation = "0";
      result = "0";
      notifyListeners();

    } else if (buttonText == "⌫") {
      equation = equation.substring(0, equation.length - 1);
      if (equation == "") {
        equation = "0";
        notifyListeners();
      }
    } else if (buttonText == "+/-") {
      if (equation[0] != '-') {
        equation = '-$equation';
        notifyListeners();
      } else {
        equation = equation.substring(1);
        notifyListeners();
      }
    } else if (buttonText == "=") {
      expression = equation;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');
      expression = expression.replaceAll('%', '%');
      notifyListeners();

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        notifyListeners();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        notifyListeners();
        if (expression.contains('%')) {
          notifyListeners();
          result = doesContainDecimal(result*10);

          notifyListeners();
        }
      } catch (e) {
        result = "Error";
        notifyListeners();
      }
    } else {
      if (equation == "0") {
        equation = buttonText;
        notifyListeners();
      } else {
        equation = equation + buttonText;
        notifyListeners();
      }
    }
notifyListeners();
  }

}


