import 'teacher.dart';

class Coursera {
  List<Teacher> teachers = [];

  // register teacher: takes name, email, password
  void registerTeacher(String name, String email, String password) {
    teachers.add(Teacher(name, email, password));
  }

  // Login teacher: takes name and password
  Teacher? loginTeacher(String name, String password) {
    for (var teacher in teachers) {
      if (teacher.name == name && teacher.password == password) {
        return teacher;
      }
    }
    return null;
  }
}