import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  final _mybox = Hive.box('mybox');

  void createInitialData() {
    todoList = [
      ["Make Tutorial", false],
      ["Do Tutorial", false],
    ];
  }

  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  void updateDatabase() {
    _mybox.put("TODOLIST", todoList);
  }
}
