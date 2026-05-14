import 'base_content.dart';

class Sheet extends BaseContent {
  int sheetNumber;
  String filename;

  Sheet(this.sheetNumber, String description, this.filename) : super("Sheet #$sheetNumber", description);
}