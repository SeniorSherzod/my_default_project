import 'package:flutter/material.dart';
import 'package:my_default_project/screens/calculator_screens/widgets/calc_button.dart';
import 'package:my_default_project/utils/extensions/extensions.dart';
import 'package:my_default_project/view_model/calculator_view_model/calculator_view.dart';
import 'package:provider/provider.dart';
class CalculatorView extends StatefulWidget {
  const CalculatorView({
    super.key,
  });

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}
class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    var calculatorViewModel = context.watch<CalculatorViewModel>();

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black54,
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child:
                  Text('Calculator', style: TextStyle(color: Colors.white38)),
            ),
            SizedBox(width: 20),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: width * 0.7,
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(calculatorViewModel.result,
                                    maxLines: 1,
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 60))),
                          ),
                          const Icon(Icons.arrow_back_ios_rounded,
                              color: Colors.orange, size: 30),
                          const SizedBox(width: 20),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              width: width * 0.7,
                              child: Text(calculatorViewModel.equation,
                                  maxLines: 1,
                                  textAlign: TextAlign.right,
                                  style:const  TextStyle(
                                    fontSize: 40,
                                    color: Colors.white38,
                                  )),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.backspace_outlined,
                                color: Colors.orange, size: 30),
                            onPressed: () {
                              context.read<CalculatorViewModel>().buttonPressed("⌫");
                            },
                          ),
                          const SizedBox(width: 20),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('AC', Colors.white10,
                      () => calculatorViewModel.buttonPressed('AC'),context),
                  calcButton('%', Colors.white10,
                      () => calculatorViewModel.buttonPressed('%'),context),
                  calcButton('÷', Colors.white10,
                      () => calculatorViewModel.buttonPressed('÷'),context),
                  calcButton("×", Colors.orange,
                      () => calculatorViewModel.buttonPressed('×'),context),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('7', Colors.white24,
                      () => calculatorViewModel.buttonPressed('7'),context),

                  calcButton('8', Colors.white24,
                      () => calculatorViewModel.buttonPressed('8'),context),
                  calcButton('9', Colors.white24,
                      () => calculatorViewModel.buttonPressed('9'),context),
                  calcButton('-', Colors.orange,
                      () => calculatorViewModel.buttonPressed('-'),context),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcButton('4', Colors.white24,
                      () => calculatorViewModel.buttonPressed('4'),context),
                  calcButton('5', Colors.white24,
                      () => calculatorViewModel.buttonPressed('5'),context),
                  calcButton('6', Colors.white24,
                      () => calculatorViewModel.buttonPressed('6'),context),
                  calcButton('+', Colors.orange,
                      () => calculatorViewModel.buttonPressed('+'),context),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: width * 0.03),
                          calcButton('1', Colors.white24,
                              () => calculatorViewModel.buttonPressed('1'),context),
                          SizedBox(width: width * 0.03),
                          calcButton('2', Colors.white24,
                              () => calculatorViewModel.buttonPressed('2'),context),
                          SizedBox(width: width * 0.03),
                          calcButton('3', Colors.white24,
                              () => calculatorViewModel.buttonPressed('3'),context),
                          SizedBox(width: width * 0.03),
                          calcButton('+/-', Colors.orange,
                              () => calculatorViewModel.buttonPressed('+/-'),context),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: width * 0.04),
                          calcButton('0', Colors.white24,
                              () => calculatorViewModel.buttonPressed('0'),context),
                          SizedBox(width: width * 0.04),
                          calcButton('.', Colors.white24,
                              () => calculatorViewModel.buttonPressed('.'),context),
                          SizedBox(width: width * 0.03),
                          calcButton('=', Colors.orange,
                              () => calculatorViewModel.buttonPressed('='),context),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
