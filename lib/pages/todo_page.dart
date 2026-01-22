import 'package:flutter/material.dart';
import 'package:flutter_basics/components/dialogue_box.dart';
import 'package:flutter_basics/components/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final controller = TextEditingController();
  // list of todo tasks
  List todoList = [
    ["Make a Todo App", false],
    ["Touch Grass", true],
  ];

  void saveNewTask() {
    setState(() {
      todoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
  }

  void toggleTaskStatus(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
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

  void deleteFunction() {}

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
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => toggleTaskStatus(value, index),
            deleteFunction: (context) => deleteFunction,
          );
        },
      ),
    );
  }
}
