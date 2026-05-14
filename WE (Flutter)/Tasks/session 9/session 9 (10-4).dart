import 'dart:io';

void main() => Coursera().start();

class BaseContent {
  String name;
  String description;
  BaseContent(this.name, this.description);
}

class Lecture extends BaseContent {
  String filename;
  Lecture(String name, String description, this.filename) : super(name, description);
}

class Sheet extends BaseContent {
  int sheetNumber;
  String filename;
  Sheet(this.sheetNumber, String description, this.filename) : super("Sheet #$sheetNumber", description);
}

class Course extends BaseContent {
  List<Lecture> lectures = [];
  List<Sheet> sheets = [];

  Course(String name, String description) : super(name, description);

  void addNewLecture(Lecture lecture) => lectures.add(lecture);
  void addNewSheet(Sheet sheet) => sheets.add(sheet);
}

class Teacher {
  String name;
  String email;
  String password;
  List<Course> courses = [];

  Teacher(this.name, this.email, this.password);

  void addNewCourse(Course course) => courses.add(course);
}

class Coursera {
  List<Teacher> teachers = [];
  Teacher? loggedInTeacher;

  void start() {
    bool keepRunning = true;
    while (keepRunning) {
      print("\n--- Coursera System ---");
      print("1- Register Teacher");
      print("2- Login");
      print("3- Add Course (After Login)");
      print("4- Add Lecture to Course");
      print("5- Exit");
      stdout.write("Choose an option: ");
      String? choice = stdin.readLineSync();

      if (choice == '1') {
        _register();
      } else if (choice == '2') {
        _login();
      } else if (choice == '3') {
        _addCourse();
      } else if (choice == '4') {
        _addLecture();
      } else if (choice == '5') {
        keepRunning = false;
      }
    }
  }

  void _register() {
    stdout.write("Enter Name: ");
    String name = stdin.readLineSync() ?? "";
    stdout.write("Enter Email: ");
    String email = stdin.readLineSync() ?? "";
    stdout.write("Enter Password: ");
    String pass = stdin.readLineSync() ?? "";
    teachers.add(Teacher(name, email, pass));
    print("new teacher $name registered successfully");
  }

  void _login() {
    stdout.write("Enter Name: ");
    String name = stdin.readLineSync() ?? "";
    stdout.write("Enter Password: ");
    String pass = stdin.readLineSync() ?? "";
    for (var t in teachers) {
      if (t.name == name && t.password == pass) {
        loggedInTeacher = t;
        print("LogIn Successfully , Welcome ${t.name}");
        return;
      }
    }
    print("Login Failed!");
  }

  void _addCourse() {
    if (loggedInTeacher == null) {
      print("Please login first!");
      return;
    }
    stdout.write("Enter Course Name: ");
    String cName = stdin.readLineSync() ?? "";
    stdout.write("Enter Course Description: ");
    String cDesc = stdin.readLineSync() ?? "";
    var newCourse = Course(cName, cDesc);
    loggedInTeacher!.addNewCourse(newCourse);
    print("Course $cName Added to teacher ${loggedInTeacher!.name}");
  }

  void _addLecture() {
    if (loggedInTeacher == null || loggedInTeacher!.courses.isEmpty) {
      print("No courses found!");
      return;
    }
    stdout.write("Enter Lecture Name: ");
    String lName = stdin.readLineSync() ?? "";
    loggedInTeacher!.courses.last.addNewLecture(Lecture(lName, "Course Content", "file.mp4"));
    print("lecture $lName added to course ${loggedInTeacher!.courses.last.name}");
  }
}