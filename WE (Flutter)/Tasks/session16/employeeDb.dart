import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class EmployeeDB {
  Database? database;
  List<Map> emps = [];

  Future<Database> createTable() async {
    if (database != null) return database!;

    String databasesPath = await getDatabasesPath();
    String dbPath = path.join(databasesPath, "firstpro.db");

    database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        print("Database Created!");

        await db.execute('''
        CREATE TABLE employee(
          employee_id INTEGER PRIMARY KEY AUTOINCREMENT,
          fullname TEXT,
          salary INTEGER,
          department_name TEXT
        )
        ''');

        print("Created Table Finished");
      },
      onOpen: (db) {
        print("Database Open successfully");
      },
    );

    return database!;
  }

  Future<List<Map>> getEmployeeData(Database obj) async {
    return await obj.rawQuery(
      "SELECT * FROM employee",
    );
  }

  Future<void> fillData({
    required String fn,
    required int salary,
    required String dn,
  }) async {
    if (database == null) await createTable();

    await database!.rawInsert(
      "INSERT INTO employee(fullname,salary,department_name) VALUES(?,?,?)",
      [fn, salary, dn],
    );
  }

  Future<void> updatedata({
    required String fn,
    required int sal,
    required int id,
    required String dn,
  }) async {
    if (database == null) await createTable();

    await database!.rawUpdate(
      "UPDATE employee SET fullname=?,salary=?,department_name=? WHERE employee_id=?",
      [fn, sal, dn, id],
    );
  }

  Future<void> deleteEmployee({
    required int id,
  }) async {
    if (database == null) await createTable();

    await database!.rawDelete(
      "DELETE FROM employee WHERE employee_id=?",
      [id],
    );
  }
}