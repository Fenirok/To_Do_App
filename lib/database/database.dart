import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List todoList = [];
  //reference the box
  final _myBox = Hive.box('myBox');

  //for first time opening the app
  void createInitialData() {
    todoList = [];
  }

  //load the data from the database
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", todoList);
  }
}
