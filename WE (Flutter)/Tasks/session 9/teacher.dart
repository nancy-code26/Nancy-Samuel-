import 'course.dart';

class Teacher {
  String name;
  String email;
  String password;
  List<Course> courses = [];

  Teacher(this.name, this.email, this.password);

  //add and delete courses
  void addNewCourse(Course course) => courses.add(course);
  void deleteCourse(String courseName) => courses.removeWhere((c) => c.name == courseName);
}
