import 'package:flutter/material.dart';
import 'package:flutter_basics/components/dialogue_box.dart';
import 'package:flutter_basics/components/todo_tile.dart';
import 'package:flutter_basics/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});
  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final controller = TextEditingController();
  final myBox = Hive.box('myBox');
  TodoDataBase db = TodoDataBase();

  void saveNewTask() {
    setState(() {
      db.todoList.add([controller.text, false]);
      controller.clear();
    });
    db.updateDatabase();
    Navigator.of(context).pop();
  }

  void toggleTaskStatus(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox(
          controller: controller,
          saveNewTask: saveNewTask,
          cancelTask: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteFunction(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  void initState() {
    // if this is the 1st time ever opening the app
    if (myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: Center(
          child: Text(
            "TODOs",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add, size: 30),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => toggleTaskStatus(value, index),
            deleteFunction: (context) => deleteFunction(index),
          );
        },
      ),
    );
  }
}
