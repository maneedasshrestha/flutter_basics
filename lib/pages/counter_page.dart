import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;

  void incrementCount() {
    // setstate rebuilds the widget
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Counter App"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times"),
            Text(count.toString(), style: TextStyle(fontSize: 30)),
            ElevatedButton(
              onPressed: incrementCount,
              child: Icon(Icons.add, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
