import 'dart:io';
import 'package:untitled3/car.dart';

main() {
  List<Car> cars = [];

  // 1- Number of cars:
  stdout.write("Enter numbers of CARS: ");
  int count = int.parse(stdin.readLineSync()!);

  // 2- Fill car Info:
  for (int i = 0; i < count; i++) {
    print("Enter Info for Car #${i + 1}");
    Car c = Car();
    c.fillData();
    cars.add(c);
  }

  // 3- Print all car Info:
  print("All Car Info:");
  for (var c in cars) {
    c.printData();
  }

  // 4- Total price:
  double totalPrice = 0;
  for (var c in cars) {
    totalPrice += c.price!;
  }
  print("4- Total Price: $totalPrice");

  // 5- Total price with discount 15%:
  double discountPrice = totalPrice * 0.85;
  print("5- Total Price After 15% Discount: $discountPrice");

  // 6-7 Max & Min:
  Car maxCar = cars[0];
  Car minCar = cars[0];

  for (var c in cars) {
    if (c.price! > maxCar.price!) {
      maxCar = c;
    }
    if (c.price! < minCar.price!) {
      minCar = c;
    }
  }

  print("6- Max Car: ${maxCar.model} | Price: ${maxCar.price}");
  print("7- Min Car: ${minCar.model} | Price: ${minCar.price}");
}