import 'base_content.dart';

class Lecture extends BaseContent {
  String filename;

  Lecture(String name, String description, this.filename) : super(name, description);
}
