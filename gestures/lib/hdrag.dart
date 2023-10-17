import 'package:flutter/material.dart';

class HDRag extends StatefulWidget {
  const HDRag({super.key});

  @override
  State<HDRag> createState() => _HDRagState();
}

String txt = "<- Swipe ->";
Color color = Colors.purple;

class _HDRagState extends State<HDRag> {
  final double _scaleFactor = 1.0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color),
            child: Text(
              txt,
               textScaleFactor: _scaleFactor,
               style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
          ),

          onHorizontalDragUpdate: (details) {
            if (details.delta.dx > 0) {
              setState(() {
                color = const Color.fromARGB(255, 117, 181, 202);
                txt = "Left";
               
              });
            } else {
              setState(() {
                color = const Color.fromARGB(255, 98, 141, 236);
                txt = "Right";
              });
            }
          },
        ),
      ),
    );
  }
}
