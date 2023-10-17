import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import ChangeNotifierProvider from the 'provider' package
import 'todoprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return TodoProvider();
      },
      child: const MyTodo(),
    ),
  );
}

class MyTodo extends StatelessWidget {
  const MyTodo({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      home: const MyTodoApp(title: 'Todo List'),
    );
  }
}

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({Key? key, required this.title});

  final String title;

  @override
  _MyTodoAppState createState() =>
      _MyTodoAppState(); // Override createState correctly
}

class _MyTodoAppState extends State<MyTodoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ... rest of your code
        );
  }
}
