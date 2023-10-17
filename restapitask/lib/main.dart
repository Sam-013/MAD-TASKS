import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Diseasesh {
  final String baseUrl;

  Diseasesh(this.baseUrl);

  Future<http.Response> get(String path) async {
    final url = Uri.parse('$baseUrl/$path');
    return await http.get(url);
  }

  Future<http.Response> post(String path, Map<String, String> body) async {
    final url = Uri.parse('$baseUrl/$path');
    return await http.post(url, body: body);
  }

  Future<http.Response> put(String path, Map<String, String> body) async {
    final url = Uri.parse('$baseUrl/$path');
    return await http.put(url, body: body);
  }

  Future<http.Response> delete(String path) async {
    final url = Uri.parse('$baseUrl/$path');
    return await http.delete(url);
  }
}

class User {
  final int id;
  final String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }
}

Future<List<User>> getUsers() async {
  final apiClient = Diseasesh('https://disease.sh/');

  final response = await apiClient.get('/users');

  if (response.statusCode == 200) {
    final users = jsonDecode(response.body) as List<dynamic>;
    return users.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to get users: ${response.statusCode}');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rest Api'),
        ),
        body: FutureBuilder<List<User>>(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];
                  return ListTile(
                    title: Text(user.name),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
