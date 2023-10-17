import 'package:flutter/material.dart';

class OnScaleApp extends StatefulWidget {
  const OnScaleApp({super.key});

  @override
  State<OnScaleApp> createState() => _OnScaleAppState();
}

String img = "assets/images/johnwick.jpg";
Color color = const Color.fromARGB(255, 240, 239, 237);

class _OnScaleAppState extends State<OnScaleApp> {
  double _initalScale = 1.0;
  double _scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("On Scale Screen"),
        ),
        body: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color),
            child: Image.asset(
              img,
               fit: BoxFit.cover,
               scale: _scaleFactor,
            ),
          ),

            onScaleStart: (details) {
              _initalScale = _scaleFactor;
            },
            onScaleUpdate: (details) {
              setState(() {
                _scaleFactor = _initalScale * details.scale;
              });
            },
                    
        ),
    );
  }
}
