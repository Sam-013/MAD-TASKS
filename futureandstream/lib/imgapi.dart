import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  List<dynamic> photos = [];

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      final List<dynamic> parsedPhotos = json.decode(response.body);
      setState(() {
        photos = parsedPhotos;
      });
    } else {
      throw Exception('Failed to load imgs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image List'),
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          final photo = photos[index];
          return ListTile(
            leading: Image.network(photo['thumbnailUrl']),
            title: Text(photo['title']),
          );
        },
      ),
    );
  }
}
