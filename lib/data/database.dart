import 'package:hive_flutter/adapters.dart';

class TodoDataBase {
  // reference the box i.e. open the box
  List todoList = [];
  final myBox = Hive.box('myBox');
  // rn this if its the 1st time ever opening the app
  void createInitialData() {
    todoList = [
      ['Make pancakes', false],
      ['Goto Gym', false],
    ];
  }

  // load the data from the database
  void loadData() {
    todoList = myBox.get("TODOLIST") ?? [];
  }

  // update the database
  void updateDatabase() {
    myBox.put("TODOLIST", todoList);
  }
}
