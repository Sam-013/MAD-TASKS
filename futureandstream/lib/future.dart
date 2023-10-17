import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class FutureDemo extends StatefulWidget {
  const FutureDemo({super.key});

  @override
  State<FutureDemo> createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  Future<String> getData() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      return response.body;
    } catch (e) {
      print(e);
      return "$e";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future using API"),
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
