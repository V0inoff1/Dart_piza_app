
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp( const listApp());
}

class listApp extends StatelessWidget {
  const listApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (

          appBar: AppBar(
            title: const Text ('Список шеф-мастеров '),
            actions: <Widget>[
              IconButton(
                  tooltip: 'На главную',// всплывающая подсказка
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back)),
            ],
          ),
        body: List2(

        ),
      ),
    );
  }
}

class List2 extends StatefulWidget {
  const List2({Key? key}) : super(key: key);

  @override
  _List2State createState() => _List2State();
}

class _List2State extends State<List2> {

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {


    return Container(

      decoration: BoxDecoration(
          color: Colors.orangeAccent,

      ),

      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 20,
          padding: EdgeInsets.symmetric(),
          itemBuilder: (BuildContext context, int index){


            return ListTile( // название виджета
              title: Text(' Шеф-мастер $index'),
              selected: index == _selectedIndex, // выделяет выбранный эллемент
              onTap: (){ // при нажатии
                setState(() { // происходит установка состояния
                  _selectedIndex = index;
                });
              },
            );
          }

      ),
    );
  }
}
