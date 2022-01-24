import 'dart:async'; // Асинхронные библиотеки
import 'dart:convert'; // конвертировние данных

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<Post> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Post.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

 Post({
    required this.userId,
    required this.id,
    required this.title,
  required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Тест данные из сети'),
        ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: FutureBuilder<Post>(
                future: futurePost,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.body );

                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
      ),
    );
  }
  
}

