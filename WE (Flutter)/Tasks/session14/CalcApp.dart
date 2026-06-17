import 'package:flutter/material.dart';
import 'package:untitled3/btn_calc.dart';

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalAppState();
}

class _CalAppState extends State<CalcApp> {
  String displayText = "0";


  void onButtonClick(String text) {
    setState(() {
      if (text == "DL") {
        if (displayText.length > 1) {
          displayText = displayText.substring(0, displayText.length - 1);
        } else {
          displayText = "0";
        }
      } else if (text == "=") {
        try {
          displayText = _calculateResult(displayText);
        } catch (e) {
          displayText = "Error";
        }
      } else {
        if (displayText == "0" && text != "+" && text != "-" && text != "*" && text != "/") {
          displayText = text;
        } else {
          displayText += text;
        }
      }
    });
  }


  String _calculateResult(String expression) {
    List<String> operators = ['+', '-', '*', '/'];
    String activeOp = "";

    for (var op in operators) {
      if (expression.contains(op)) {
        activeOp = op;
        break;
      }
    }

    if (activeOp.isEmpty) return expression;

    List<String> parts = expression.split(activeOp);
    if (parts.length < 2 || parts[1].isEmpty) return expression;

    double num1 = double.parse(parts[0]);
    double num2 = double.parse(parts[1]);
    double res = 0;

    switch (activeOp) {
      case '+': res = num1 + num2; break;
      case '-': res = num1 - num2; break;
      case '*': res = num1 * num2; break;
      case '/': res = num2 != 0 ? num1 / num2 : 0; break;
    }

    if (res % 1 == 0) {
      return res.toInt().toString();
    }
    return res.toString();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Text(
                  displayText,
                  style: const TextStyle(
                    fontSize: 60,
                    color: Color(0xffc2185b),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 20),


              Row(
                children: [
                  btn1(btnNameText: "1", action: () => onButtonClick("1")),
                  btn1(btnNameText: "2", action: () => onButtonClick("2")),
                  btn1(btnNameText: "3", action: () => onButtonClick("3")),
                ],
              ),

              Row(
                children: [
                  btn1(btnNameText: "4", action: () => onButtonClick("4")),
                  btn1(btnNameText: "5", action: () => onButtonClick("5")),
                  btn1(btnNameText: "6", action: () => onButtonClick("6")),
                ],
              ),

              Row(
                children: [
                  btn1(btnNameText: "7", action: () => onButtonClick("7")),
                  btn1(btnNameText: "8", action: () => onButtonClick("8")),
                  btn1(btnNameText: "9", action: () => onButtonClick("9")),
                ],
              ),

              Row(
                children: [
                  btn1(btnNameText: "0", action: () => onButtonClick("0")),
                  btn1(btnNameText: "+", action: () => onButtonClick("+")),
                  btn1(btnNameText: "-", action: () => onButtonClick("-")),
                ],
              ),

              Row(
                children: [
                  btn1(btnNameText: "*", action: () => onButtonClick("*")),
                  btn1(btnNameText: "/", action: () => onButtonClick("/")),
                  btn1(btnNameText: "DL", action: () => onButtonClick("DL")),
                  btn1(btnNameText: "=", action: () => onButtonClick("=")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}