import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'AppBar.dart';
import 'DrawerMenu.dart';
import 'Users.dart';

void main() {
  runApp(
      const UsersListPage(title: '111',)
  );
}


class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

Future<List<Users>> fetchUsers() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    final List<Users> usersList = [];
    for (var user in data) {
      Users temp = Users.fromJson(user);
      usersList.add(temp);
    }
    return usersList;
  } else {
    throw Exception('Failed to load album');
  }
}

class _UsersListPageState extends State<UsersListPage> {

  late Future<List<Users>> usersList;

  @override
  void initState() {
    super.initState();
    usersList = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: UserAppBar(context, widget),
        //drawer: UserAppDrawer(context, widget),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
              future: usersList,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Users> userss = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, i) {
                        Users users = userss [i];
                        return ListTile(
                          trailing: const Icon(Icons.supervised_user_circle_outlined),
                          title: Text(users.name),
                          subtitle: Text(users.email),
                          leading: Text(
                            users.id.toString(),
                            style: const TextStyle(fontSize: 22),
                          ),

                          /*onTap: () {
                            Navigator.pushNamed(context, '/info', arguments: {'user': users},);
                          },*/

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
      ),
    );
  }
}