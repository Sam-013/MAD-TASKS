import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatefulWidget {
  const StreamDemo({super.key});

  @override
  State<StreamDemo> createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  Stream<String> getData() async* {
    while (true) {
      DateTime dateTime = DateTime.now();
      await Future.delayed(const Duration(seconds: 1));
      yield "${dateTime.hour}:${dateTime.minute}:${dateTime.second}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Demo Showing Time"),
      ),
      body: Center(
        child: StreamBuilder<String>(
            stream: getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return Text("Time:\n${snapshot.data}");
              }
            }),
      ),
    );
  }
}
