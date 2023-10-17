import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Your widget's content here
    return Container(
      child: Text('My Widget'),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(), // Use MyWidget as the home screen
    );
  }
}
