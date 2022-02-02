import 'dart:core';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



import 'TodoItem.dart';
import 'Users.dart';

void main() {
  runApp(
      const UsersInfoPage(title: '111',)
  );
}

class UsersInfoPage extends StatefulWidget {
  const UsersInfoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UsersInfoPage> createState() => _UsersInfoPageState();
}

Future<List<TodoItem>> fetchUsersList(int userId) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=${userId}'));

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    final List<TodoItem> todosList = [];
    for (var item in data) {
      TodoItem temp = TodoItem.fromJson(item);
      todosList.add(temp);
    }
    return todosList;
  } else {
    throw Exception('Failed to load album');
  }
}

class _UsersInfoPageState extends State<UsersInfoPage> {

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    final Users users = arg['user'];
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text('${users.name} aka ${users.username}',
                  style: TextStyle(fontSize: 22),),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text('Email: ${users.email}',
                  style: TextStyle(fontSize: 16),),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text('Phone: ${users.phone}',
                  style: TextStyle(fontSize: 16),),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text('${users.username} todo list',
                  style: TextStyle(fontSize: 22),),
              ),
            ),
            FutureBuilder(
              future: fetchUsersList(users.id),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<TodoItem> items = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, i) {
                        TodoItem item = items[i];
                        return ListTile(
                          trailing: item.completed == true ?
                          Icon(Icons.check_circle) :
                          Icon(Icons.check_circle_outline_rounded)
                          ,
                          title: Text(item.title),
                          leading: Text(
                            item.id.toString(),
                            style: const TextStyle(fontSize: 22),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  );
                }
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 64, horizontal: 0),
                    child: SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator()
                    ),
                  ),
                );
              },
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),

      ),
    );
  }
}