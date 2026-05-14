import 'base_content.dart';
import 'lecture.dart';
import 'sheet.dart';

class Course extends BaseContent {
  List<Lecture> lectures = [];
  List<Sheet> sheets = [];

  Course(super.name, super.description);

  void addNewLecture(Lecture lecture) => lectures.add(lecture);
  void deleteLecture(String lectureName) => lectures.removeWhere((l) => l.name == lectureName);

  void addNewSheet(Sheet sheet) => sheets.add(sheet);
  void deleteSheet(String sheetName) => sheets.removeWhere((s) => s.name == sheetName);
}
