
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const ListViewScreen());
}

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SimpleList(),
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  const MyListItem({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all()
      ),
      child: Text ('Элемент # $number', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class SimpleList extends StatelessWidget {
  const SimpleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical, // вертикальный список
      /*children: [

        MyListItem(number: 1),
        MyListItem(number: 2),
        MyListItem(number: 3),
        MyListItem(number: 4),
        MyListItem(number: 5),
        MyListItem(number: 6),
        MyListItem(number: 7),
        MyListItem(number: 8),
        MyListItem(number: 9),
        MyListItem(number: 10),
        MyListItem(number: 11),
        MyListItem(number: 12),
        MyListItem(number: 13),

      ], */ // список с иконками
      children: const <Widget>[ // что бы начал работать тап, нужно убрать const
        ListTile(
          leading: const Icon(Icons.map),
          title: const Text('Map',),
          //onTap: () {},
    ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
        ),
      ],
    );
  }
}

// создание списка методом билдер, позволяет работать с данными за системой
// бесконечный список. Название этого класса нужно поместить в боди класса ListViewScreen

class SimpleListBuilder extends StatelessWidget {
   SimpleListBuilder({Key? key}) : super(key: key);

  //var list =  List <int>.generate(50, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index){
          return MyListItem(number: index);
            }
        );
  }
}


// список с разделителями
class SimpleListSeparated extends StatelessWidget {
   SimpleListSeparated({Key? key}) : super(key: key);

var list =new List <int>.generate(50, (i) => i +1 );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount:list.length,
        itemBuilder: (BuildContext context, int index){
          return MyListItem(number: index);
        },
        separatorBuilder: (BuildContext context, int index)=> const Divider (thickness: 3,)
    );
  }
}

// кликабельный список

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10, // колличество создаваемых эллементов
        itemBuilder: (BuildContext context, int index){
        return ListTile( // название виджета
          title: Text(' Item $index'),
          selected: index == _selectedIndex, // выделяет выбранный эллемент
          onTap: (){ // при нажатии
            setState(() { // происходит установка состояния
              _selectedIndex = index;
            });
          },
        ) ;
        }
    );
  }
}

