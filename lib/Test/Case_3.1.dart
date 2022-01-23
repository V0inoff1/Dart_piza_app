import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const myApp());

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared preferences demo',
      home: Buttom (title: ' Test ',) ,
    );
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}

class Buttom extends StatefulWidget {
  const Buttom({Key? key, required this.title,}) : super(key: key);
  final String title;



  @override
  _ButtomState createState() => _ButtomState();
}

class _ButtomState extends State<Buttom> {
  int _counter = 0;
  int _counter3 = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  @override
  void initState3() {
    super.initState();
    _loadCounter3();
  }

  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  void _loadCounter3() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter3 = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  void _incrementCounter3() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter3 = (prefs.getInt('counter3') ?? 0) + 1;
      prefs.setInt('counter3', _counter3);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('Submit 1'),
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: _incrementCounter3,
                child: const Text('Submit 2'),
              ),

            ),
             Text(
              '$_counter3',
              style: Theme.of(context).textTheme.headline4,
            ),

          ],
        ),
      ),
    );
  }
}




