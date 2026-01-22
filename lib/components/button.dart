import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  void Function()? onPressed;
  MyButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(),
      child: Text(buttonName),
    );
  }
}
