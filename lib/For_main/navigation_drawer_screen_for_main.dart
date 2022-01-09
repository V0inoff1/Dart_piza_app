import 'package:flutter/material.dart';

void main() {
  runApp( const NavigationDrawerScreen ());

}


class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  final _messengerKey = GlobalKey <ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle=
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return MaterialApp(
        scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text ('CosmoPizza'),
            actions: <Widget>[
        IconButton(
        tooltip: 'Поиск',// всплывающая подсказка
            onPressed: () {},
            icon: Icon(Icons.manage_search)),
        ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Navigation_screen_DrawerHeader.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     /*
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/f1.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        //child: Image.network('https://miro.medium.com/max/1400/1*3vx7gPf7llS6-OzDj-XTSQ.png'),
                      ),

                      const Text('Приложение Воинова Егора')
                      */
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add_to_queue_sharp ),
                title: const Text('Каталог'),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text('Переход в каталог')));
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_shopping_cart),
                title: const Text('Корзина'),
                onTap: () {
                   _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text('Переход в корзину')));
                },
              ),
              /*
              ListTile(
                leading: const Icon(Icons.manage_search),
                title: const Text('Поиск'),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text('Переход в корзину')));
                },
              ),*/
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Профиль'),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Настройки'),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text('Переход в настройки')));
                },
              ),
            ],
          ),
        ),
        body: Center(child: Text('Содержимое экрана')),
      )
    );
  }
}
