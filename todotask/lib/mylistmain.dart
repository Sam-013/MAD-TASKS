import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/movie_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider<MovieProvider>(
     
      create: (_) => MovieProvider(),
    ),
      ],
       child: const MyApp(),
    ),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My List App',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
       ),
      home: const HomeScreen(),
    );
  }
}

