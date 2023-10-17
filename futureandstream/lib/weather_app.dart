import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchWeatherData(String apiKey, String location) async {
  final response = await http.get(
    Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$location&days=7'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  String location = 'New York';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'Location: $location',
              style: const TextStyle(fontSize: 18),
            ),
           FutureBuilder<Map<String, dynamic>>(
  future: fetchWeatherData('0e2f7775a99b4e82b0743257231609', location),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      final weatherData = snapshot.data;
      // Parse and display the weather data here
      return Text('Temperature: ${weatherData?['current']['temp_c']}°C');
    }
  },
),
        Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    const Text('Change Location:'),
    const SizedBox(width: 10),
    SizedBox(
      width: 200,
      child: TextField(
        onChanged: (value) {
          setState(() {
            location = value;
          });
        },
        decoration: const InputDecoration(
          hintText: 'Enter Location',
        ),
      ),
    ),
    const SizedBox(width: 10),   
  ],
),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
             ElevatedButton(
              onPressed: () {
                setState(() {
                  // Trigger a new fetch when the user updates the location
                  location = location; // Simply reassigning it here, you may perform validation
                });
              },
      child: const Text('Update'),
    ),
      ],
    )


          ],
        ),
      ),
    );
  }
}
