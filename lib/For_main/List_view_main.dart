import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const ListViewScreen());
}

class User{
  String name;
  String Phone;
  User(this.name, this.Phone);
}
const List <String> users = <String>["Ул.Лениена 22", "Ул. Победы 32 ", "Ул. Победы 102", "Ул. Октября 15", "Ул. Ворошилова 32"];
const List <String> companies = <String>["1-111-111", "2-222-222", "3-333-333", "4-444-444", "5-555-555"];

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text ('CosmoPizza'),
          actions: <Widget>[
            IconButton(
                tooltip: 'На главную',// всплывающая подсказка
                onPressed: () {},
                icon: Icon(Icons.arrow_back)),
          ],
        ),
        body:  Container(

          child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(8),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(

                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Адрес : ${users[index]}", style: Theme.of(context).textTheme.headline5, ),
                        Text("Телефон для связи: ${companies[index]}", style: Theme.of(context).textTheme.headline5, )
                      ],

                    )
                );

              }
          ),
        ),
      ),
    );
  }
}




