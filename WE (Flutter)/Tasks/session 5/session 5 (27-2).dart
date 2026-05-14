import 'dart:io';

void main() {

  List<int> mylist = [];
  String another;


  do {

    // MENU
    print("Select an option (1-5):");
    print("1- Add value");
    print("2- Remove value");
    print("3- Update value");
    print("4- Show all values");
    print("5- Search value");

    int? choice = int.parse(stdin.readLineSync()!);

    if (choice == null) {
      print("Invalid input.");
      continue;
    }

    //ADD:
    if (choice == 1) {
      print("Enter value to add:");
      int? val = int.parse(stdin.readLineSync()!);
      if (val != null) {
        mylist.add(val);
        print("Value $val added.");

        print("--- Current List ---");
        print(mylist.join(", "));
      } else {
        print("Invalid input.");
      }
    }

    //REMOVE:
    else if (choice == 2) {
      if (mylist.isEmpty) {
        print("The list is empty. Please add values first.");
      } else {
        print("Choose removal method:\na) Remove by value\nb) Remove by index");
        String? method = stdin.readLineSync();
        if (method == 'a') {

          print("Enter value to remove:");
          int? valToRemove = int.parse(stdin.readLineSync()!);
          if (valToRemove != null) {
            for (int i = 0; i < mylist.length; i++) {
              if (mylist[i] == valToRemove) {
                mylist.removeAt(i);
                print("Value $valToRemove removed.");
                print("--- Current List ---");
                print(mylist.join(", "));
                break;
              }
              if (i == mylist.length - 1) {
                print("Value not found.");
              }
            }
          } else {
            print("Invalid input.");
          }
        }
        else if (method == 'b') {

          print("Enter index to remove:");
          int? index = int.parse(stdin.readLineSync()!);
          if (index != null && index >= 0 && index < mylist.length) {
            int removedValue = mylist.removeAt(index);
            print("Value $removedValue at index $index removed.");
            print("--- Current List ---");
            print(mylist.join(", "));
          } else {
            print("Invalid index.");
          }
        }
        else {
          print("Invalid option.");
        }
      }
    }

    //UPDATE:
    else if (choice == 3) {
      if (mylist.isEmpty) {
        print("The list is empty. Please add values first.");
      } else {
        print("Enter old value to update:");
        int? oldVal = int.parse(stdin.readLineSync()!);
        if (oldVal != null) {
          for (int i = 0; i < mylist.length; i++) {
            if (mylist[i] == oldVal) {
              print("Enter new value:");
              int? newVal = int.parse(stdin.readLineSync()!);
              if (newVal != null) {
                mylist[i] = newVal;
                print("Value updated from $oldVal to $newVal.");

                print("--- Current List ---");
                print(mylist.join(", "));
              } else {
                print("Invalid input.");
              }
              break;
            }
            if (i == mylist.length - 1) {
              print("Value not found.");
            }
          }
        } else {
          print("Invalid input.");
        }
      }
    }

    //SHOW:
    else if (choice == 4) {
      if (mylist.isEmpty) {
        print("The list is empty.");
      } else {
        print("--- Current List ---");
        print(mylist.join(", "));
      }
    }

    //SEARCH:
    else if (choice == 5) {
      if (mylist.isEmpty) {
        print("The list is empty. Please add values first.");
      } else {
        print("Search options:\n1- Found / Not Found (by value)\n2- Get value by index");
        int? searchOption = int.parse(stdin.readLineSync()!);

        if (searchOption == 1) {

          print("Enter value to search:");
          int? searchVal = int.parse(stdin.readLineSync()!);
          if (searchVal != null) {
            if (mylist.contains(searchVal)) {
              print("Result: Found");
            } else {
              print("Result: Not Found");
            }
          } else {
            print("Invalid input.");
          }
        }
        else if (searchOption == 2) {

          print("Enter index to search:");
          int? index = int.parse(stdin.readLineSync()!);
          if (index != null && index >= 0 && index < mylist.length) {
            print("Value at index $index is: ${mylist[index]}");
          } else {
            print("Not found");
          }
        }
        else {
          print("Invalid search option.");
        }
      }
    }
    print("Another order yes(y) or no(n)?");
    another = stdin.readLineSync()!;

  } while (another == "y");

}