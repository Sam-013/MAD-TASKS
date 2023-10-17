import 'package:flutter/material.dart';
import 'dart:async';

class Future2Demo extends StatefulWidget {
  const Future2Demo({super.key});

  @override
  State<Future2Demo> createState() => _Future2DemoState();
}

class _Future2DemoState extends State<Future2Demo> {
    Future<String> getData() async {

    await Future.delayed(const Duration(microseconds: 20000));
    return "Greetings!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Demo 2 using delayed"),
      ),
      body: Center(
        child: FutureBuilder<String>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return Text("${snapshot.data}");
              }
            }),
      ),
    );
  }
}
