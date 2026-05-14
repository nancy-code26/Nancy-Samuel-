import 'dart:io';

main() {

  print("Enter start table:");
  int startTable = int.parse(stdin.readLineSync()!);

  print("Enter end table:");
  int endTable = int.parse(stdin.readLineSync()!);

  print("Enter start number:");
  int startNum = int.parse(stdin.readLineSync()!);

  print("Enter end number:");
  int endNum = int.parse(stdin.readLineSync()!);

  for(int table = startTable; table<= endTable; table++){
    for(int num = startNum; num<= endNum; num++){
      print(" $table * $num = ${ table * num }");
    }
  }

}