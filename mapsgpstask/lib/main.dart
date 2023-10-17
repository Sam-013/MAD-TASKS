import 'package:flutter/material.dart';
import 'package:location_and_address/location_and_address.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LocationAndAddress(),
    );
  }
}
