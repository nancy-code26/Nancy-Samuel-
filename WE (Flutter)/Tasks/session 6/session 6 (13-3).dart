import 'dart:io';

void main() {
  List<Map> students = [];

  print("Enter number of students:");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    print("Enter id:");
    int id = int.parse(stdin.readLineSync()!);

    print("Enter name:");
    String name = stdin.readLineSync()!;

    int sub;
    do {
      print("Enter number of subjects:");
      sub = int.parse(stdin.readLineSync()!);

      if (sub < 3) {
        print("Number of subjects is less than 3, please enter more.");
      }
    } while (sub < 3);

    Map degrees = {};

    for (int j = 0; j < sub; j++) {
      print("Enter subject name:");
      String subject = stdin.readLineSync()!;

      print("Enter degree:");
      int degree = int.parse(stdin.readLineSync()!);

      degrees[subject] = degree;
    }

    students.add({
      "id": id,
      "name": name,
      "deg": degrees
    });
  }

  double maxPer = 0;
  double minPer = 101;
  String maxName = "";
  String minName = "";

  for (int i = 0; i < students.length; i++) {
    int total = 0;

    students[i]["deg"]!.forEach((k, v) {
      total += v as int;
    });

    double per = (total / (students[i]["deg"]!.length * 100)) * 100;

    String grade = "";
    if (per >= 85) grade = "Excellent";
    else if (per >= 75) grade = "Very Good";
    else if (per >= 65) grade = "Good";
    else if (per >= 50) grade = "Pass";
    else grade = "Fail";

    print("ID: ${students[i]['id']}");
    print("Name: ${students[i]['name']}");
    print("Total: $total");
    print("Per: $per %");
    print("Grade: $grade");

    print("----------------");

    if (per > maxPer) {
      maxPer = per;
      maxName = students[i]['name'];
    }

    if (per < minPer) {
      minPer = per;
      minName = students[i]['name'];
    }
  }

  print("Max Degree Student");
  print("Name: $maxName");
  print("Per: $maxPer %");

  print("\nMin Degree Student");
  print("Name: $minName");
  print("Per: $minPer %");
}