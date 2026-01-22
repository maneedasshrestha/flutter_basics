import 'package:flutter/material.dart';
import 'package:flutter_basics/components/button.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback saveNewTask;
  VoidCallback cancelTask;
  DialogueBox({
    super.key,
    required this.controller,
    required this.saveNewTask,
    required this.cancelTask,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter a new task:",
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyButton(buttonName: 'Add Task', onPressed: saveNewTask),
                  const SizedBox(width: 10),
                  MyButton(buttonName: "Cancel", onPressed: cancelTask),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
