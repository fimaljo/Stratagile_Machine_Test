import 'package:sqflite/sqflite.dart';

class SqlHelper {
  SqlHelper._();
 
  static late Database database;

  static String todoTable = "todo";


  //init
  static initDb() async {
    var databasesPath = await getDatabasesPath();

    try {
      String path = '$databasesPath/todoDB';

      database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $todoTable ( ID INTEGER PRIMARY KEY AUTOINCREMENT, TITLE TEXT,  discription TEXT,)');
      });

    } catch (_) {}
  }

  //insert

  static Future<int> insertdata(String query) async {
    return await database.rawInsert(query);
  }

  //read data
  static Future<List<Map<String, Object?>>> readData(String query) async {
    return await database.rawQuery(query);
  }

  //update data
  static Future<int> updateData(String query) async {
    return await database.rawUpdate(query);
  }

  //delete data
  static Future<int> deleteData(String query) async {
    return await database.rawDelete(query);
  }

}
