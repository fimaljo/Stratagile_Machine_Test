import 'package:flutter/foundation.dart';
import 'package:stratagile_machine_test/domain/home/model/todo_model.dart';

import '../../infrastructure/home/sql_helper.dart';

class LocalDBProvider with ChangeNotifier {
  List<TodoModel> todoList = [];

// read data from todo table
  readData() async {
    todoList = [];
    List<Map<String, dynamic>> data =
        await SqlHelper.readData("select * from ${SqlHelper.todoTable}");

    for (Map<String, dynamic> element in data) {
      todoList.add(TodoModel.fromJson(element));
    }
    notifyListeners();
  }

// insert data from todo table
  insertData(String title, String discription) async {
    String query =
        "insert into ${SqlHelper.todoTable}(title,discription ) values('$title','$discription')";
    await SqlHelper.insertdata(query);
   
  }

// updateData from todo table
  updateData(String title, String discription, int id) async {
    String query =
        "update ${SqlHelper.todoTable} set title='$title',discription='$discription' where id='$id'";
    await SqlHelper.updateData(query);
    
  }

//  delete data from todo table
  delete(int id) async {
    String query = "delete from ${SqlHelper.todoTable} where id='$id'";
    await SqlHelper.deleteData(query);
    readData();
  }
}
