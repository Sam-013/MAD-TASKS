import 'package:flutter/material.dart';
import 'package:futureandstream/future.dart';
import 'package:futureandstream/future2.dart';
import 'package:futureandstream/stream.dart';
import 'package:futureandstream/weather_app.dart';

import 'imgapi.dart';

class FandS extends StatefulWidget {
  const FandS({super.key});

  @override
  State<FandS> createState() => _FandSState();
}

class _FandSState extends State<FandS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future&Stream"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FutureDemo()),
              );
            },
            child: const Text("Future-1"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Future2Demo()),
              );
            },
            child: const Text("Future-2"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WeatherForecastScreen()),
              );
            },
            child: const Text("Weather Forecasting App"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PhotoListScreen()),
              );
            },
            child: const Text("Imgs from API"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StreamDemo()),
              );
            },
            child: const Text("Stream"),
          ),
        ],
      )),
    );
  }
}
