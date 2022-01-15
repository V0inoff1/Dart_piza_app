import 'package:auth_page/Utils/strings.dart';
import 'package:auth_page/Utils/them.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp( const ThemDemoscreen ());

}
class ThemDemoscreen extends StatelessWidget {
  const ThemDemoscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Them1(),
      home: DemoThemScren(),
    );
  }
}





class DemoThemScren extends StatefulWidget {
  const DemoThemScren({Key? key}) : super(key: key);

  @override
  _DemoThemScrenState createState() => _DemoThemScrenState();
}

class _DemoThemScrenState extends State<DemoThemScren> {
  double _currentSliderValue =20;
  bool _isDarkTheme= false;

  Widget _navigationDraw()=> Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue
          ),
            child: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius:
                        BorderRadius.all(Radius.circular(50.0))),
                    child: Image.network(
                        'https://www.murphysmultiverse.com/wp-content/uploads/2020/10/spider-verse-copy-1536x864.jpg'),
                  ),
                  const Text('Навигация')
                ],
              ),
            ),
        ),
        ListTile(
          leading: const Icon(Icons.add_shopping_cart),
          title: const Text('Корзина'),
          onTap: () { },
        ),
        ListTile(
          leading: const Icon(Icons.add_shopping_cart),
          title: const Text('Корзина'),
          onTap: () {},
        ),
        const Divider(),
        const Padding(
            padding: EdgeInsets.only(left: 10),
          child: Text('Профиль',
          style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: const Icon(Icons.add_shopping_cart),
          title: const Text('Корзина'),
          onTap: () { },
        ),
      ],
    ),
  );

  PreferredSizeWidget _appBar() => AppBar(
    title: Text('Демо темы'),
    actions: [
      IconButton(
        icon: const Icon(Icons.add_alert),
          tooltip: 'Уведомления',
          onPressed: () {},
      ),
      IconButton(
        icon: const Icon(Icons.settings),
        tooltip: 'Уведомления',
        onPressed: () {},
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _navigationDraw (),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Загаловок', style:  Theme.of(context).textTheme.headline5),
              Container(
                height: 100,
               color: Theme.of(context).colorScheme.secondary,
              ),
              Row (
                children: const [
                  Text('Логин: '),
                  Expanded(child: TextField()),
                ],
              ),
              Row (
                children: const [
                  Text('Пароль: '),
                  Expanded(child: TextField()),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text ('Войти')),
              Text(Strings.longBodyText),
              Slider(
                  value:_currentSliderValue,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue=value;
                    });
                  }
                  ),
              SwitchListTile(
                title: Text('Темная тема'),
                  value: _isDarkTheme,
                  onChanged: (val) {
                    setState(() {
                      _isDarkTheme = !_isDarkTheme;
                      if (_isDarkTheme) {
                        globalTheme();  Them1();
                      }
                    });
                  }) ,
            ],

          ) ,
        ),
      ),
      // нижний апп бар
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar (
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Профиль'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Баланс'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Настройки'),
        ],
      ),
    );
  }
}



