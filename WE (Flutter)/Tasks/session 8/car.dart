import 'dart:io';

class Car {
  // 0- private Var
  int? _code;
  String? _color;
  double? _price;
  String? _model;

  // 1- set and get
  int? get code => _code;
  set code(int? value) => _code = value;

  String? get color => _color;
  set color(String? value) => _color = value;

  double? get price => _price;
  set price(double? value) => _price = value;

  String? get model => _model;
  set model(String? value) => _model = value;

  // 2- fill Data By User FUN
  void fillData() {
    stdout.write("Code: ");
    _code = int.parse(stdin.readLineSync()!);
    stdout.write("Color: ");
    _color = stdin.readLineSync();
    stdout.write("Price: ");
    _price = double.parse(stdin.readLineSync()!);
    stdout.write("Model: ");
    _model = stdin.readLineSync();
  }

  // 3- Print Data Info FUN
  void printData() {
    print("Code: $_code");
    print("Color: $_color");
    print("Price: $_price");
    print("Model: $_model");
  }
}