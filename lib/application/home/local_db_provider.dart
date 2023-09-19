import 'package:flutter/foundation.dart';
import 'package:stratagile_machine_test/domain/home/todo_model.dart';

import '../../infrastructure/home/sql_helper.dart';

class LocalDBProvider with ChangeNotifier {
  List<TodoModel> transoCreateList = [];

// read data from tranasfromartion table
  readData() async {
    transoCreateList = [];
    List<Map<String, dynamic>> data =
        await SqlHelper.readData("select * from ${SqlHelper.todoTable}");

    for (Map<String, dynamic> element in data) {
      transoCreateList.add(TodoModel.fromJson(element));
    }
    notifyListeners();
  }

// insert data from tranasfromartion table
  insertData(
      String title, String discription, String status, String totalDays) async {
    String query =
        "insert into ${SqlHelper.todoTable}(title,discription ) values('$title','$discription')";
    await SqlHelper.insertdata(query);
    readData();
  }

// updateData from tranasfromartion table
  updateData(String title, String discription, String status, String totalDays,
      int id) async {
    String query =
        "update ${SqlHelper.todoTable} set title='$title',discription='$discription' where id='$id'";
    await SqlHelper.updateData(query);
    readData();
  }

//  delete data from tranasfromartion table
  delete(int id) async {
    String query = "delete from ${SqlHelper.todoTable} where id='$id'";
    await SqlHelper.deleteData(query);
    readData();
  }
}
