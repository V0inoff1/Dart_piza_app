
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

import 'Utils/them.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'CosmoPizza',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const AuthScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const Loginscreen(),
        '//second': (context) => const PizzaCalcScreen(),
        '///second': (context) => const ListViewScreen(),
        '////second': (context) => const listApp(),

      },
    ),
  );
}

class AuthScreen extends StatelessWidget {
  const AuthScreen ({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFeceff1), width: 2));
    const linkTextStyle = TextStyle(
        fontSize:16,
        //fontWeight: FontWeight.bold,
        color:Colors.white// Color(0xFF0079D0)
    );

    return MaterialApp(
      home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/f1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 50),// симетричное расположение колонки при любой ореентации экрана
            child: SingleChildScrollView(
              child: Column(children:  [
                SizedBox(height: 150,),
                const SizedBox(width: 110.02,height: 83.78,child: Image(image: AssetImage('assets/Pizza free vector icons designed by xnimrodx.png'),),),
                SizedBox(height: 20,),
                Text('Наша пицца просто космос!\n            Заходи быстрее!',
                  style: TextStyle(fontSize:16,color: Colors.white /*Color.fromRGBO(0, 0, 0, 0.6)*/),),
                SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: 'Телефон',
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: 'Пароль',
                  ),
                ),
                SizedBox(height: 28,),
                SizedBox(width: 154, height: 42,child:
                     ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, '//second');
                },
                  child: Text('Войти'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0079D0),
                    shape: RoundedRectangleBorder(   //тип кнопки - скругленный прямоугольник
                      borderRadius: BorderRadius.circular(36.0), // радиус скругления
                    ),
                  ),
                ),
                ),
                SizedBox(height: 32,),
                InkWell(
                    child: Text('Регистрация',
                    style: linkTextStyle),onTap: () {
                  Navigator.pushNamed(context, '/second');
                } ),
                SizedBox(height: 20,),
                InkWell(child: Text('Забыли пароль?',style: linkTextStyle),onTap: () {}),

              ],),
            ),
          )
      ),
    );
  }
}

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFeceff1), width: 2));
    const TextStyle(
        fontSize:16,
        //fontWeight: FontWeight.bold,
        color:Colors.black// Color(0xFF0079D0)
    );

    return MaterialApp(
      home:  Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/f1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric( ),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 80,),
              const SizedBox(width: 110.02,height: 83.78,child: Image(image: AssetImage('assets/Pizza free vector icons designed by xnimrodx.png'),),),
              SizedBox(height: 10,),
              Text('Регистрация',
                style: TextStyle(fontSize:16,color: Colors.white ),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center (
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Text('Что бы зарегистрироваться введите свой номер телефона и почту',
                        style: TextStyle(fontSize:16,color: Colors.white ),textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center (
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('Телефон',
                        style: TextStyle(fontSize:16,color: Color.fromRGBO(129, 169,255, 1),),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox( width: 300,
                child:TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: '+7',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center (
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('Почта',
                        style: TextStyle(fontSize:16,color: Color.fromRGBO(129, 169,255, 1),),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox( width: 300,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: '',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center (
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('Вам придет четырехзначный код, который будет вашим паролем',
                        style: TextStyle(fontSize:16,color:  Colors.white ,),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Center (
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('Изменить пароль можно будет в личном кабинете после регистрации',
                        style: TextStyle(fontSize:16,color:  Colors.white ,),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 28,),
              SizedBox(width: 154, height: 42,child:
              ElevatedButton(onPressed: () {},
                child: Text('Отправить код'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0079D0),
                  shape: RoundedRectangleBorder(   //тип кнопки - скругленный прямоугольник
                    borderRadius: BorderRadius.circular(36.0), // радиус скругления
                  ),
                ),
              ),
              ),
              SizedBox(height: 28,),
              SizedBox(width: 110, height: 42,child:
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              },
                child: Text('Вернуться'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent ,// Color(0xFF0079D0),
                  shape: RoundedRectangleBorder(   //тип кнопки - скругленный прямоугольник
                    borderRadius: BorderRadius.circular(36.0), // радиус скругления
                  ),
                ),
              ),
              )
            ],// Тело основного виджета
            ),
          ),
        ),
      ),
    );
  }
}

class PizzaCalcScreen extends StatefulWidget {
  const PizzaCalcScreen({Key? key}) : super(key: key);

  @override
  _PizzaCalcScreenState createState() => _PizzaCalcScreenState();
}

enum Sauce {hot, sweet,cheese,garlic}

class _PizzaCalcScreenState extends State<PizzaCalcScreen> {
  final _messengerKey = GlobalKey <ScaffoldMessengerState>();

  bool _isSlimDoufht = false;
  double _pizzaSize = 20;
  int _coast = 100;
  Sauce? _sauce = Sauce.hot;
  bool _addCheese = true;
  bool _addgarlic = false;

  //

   int  _calcCoast() {
      _coast = _pizzaSize.round() + 100;

      if (_isSlimDoufht == true) _coast += 30;
      if (_addCheese == true) _coast += 50;
      if (_addgarlic == true) _coast += 70;

      switch (_sauce) {
        case Sauce.hot:
          _coast += 10;
          break;
        case Sauce.sweet:
          _coast += 20;
          break;
        case Sauce.cheese:
          _coast += 40;
          break;
        case Sauce.garlic:
          _coast += 60;
          break;

        case null :
          _sauce = Sauce.hot;
          break;
      }
      return _coast;
    }

    void _onSauceChanged(Sauce? value) {
      setState(() {
        _sauce = value;
      });
    }


  @override
  Widget build(BuildContext context) {
    /*final ButtonStyle buttonStyle=
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);*/
    return MaterialApp(
      theme: Them1(), //ТЕМА ПРИЛОЖЕНИЯ
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
        drawer: Drawer( // Тут начинается боковая панель
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
                  //color: Theme.of(context).colorScheme.secondary,
                  height: 200,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add_to_queue_sharp ),
                title: const Text('Каталог', ),
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
              ListTile(
                leading: const Icon(Icons.map),
                title: const Text('Наша география'),
                onTap: () {Navigator.pushNamed(context, '///second');

                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Мастера CosmoPizza'),
                onTap: () { Navigator.pushNamed(context, '////second');

                },
              ),

              const Divider(),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Профиль'),
              ),
              ListTile(
                leading: const Icon(Icons.person_pin_outlined),
                title: const Text('Моя CosmoPizza'),
                onTap: () {

                },
              ),


            ],
          ),
        ),
        body: Container(// В теле прописывается код страницы каркуляции пицы
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Calc_pizza_Image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(
                  height: 0,
                ),
                SizedBox(

                  height: 100,

                  //child: Image.asset(name),
                ),

                const Text('Создай свой вкус',
                  style:  TextStyle(fontSize:36,color: Colors.white )),
                const Text('Выбери вкустности',
                  style: TextStyle(fontSize:16,color: Colors.white ),),
                const SizedBox(
                  height:  12,
                ),
                SizedBox (
                  width: 300,

                  child: SlidingSwitch(
                    value: false,
                    width: 300,
                    onChanged: (bool value) {
                      _isSlimDoufht = value;
                      setState(() {
                        _calcCoast();
                      });
                    },
                    height : 30,
                    animationDuration : const Duration(milliseconds: 100),
                    onTap: () {},
                    onDoubleTap: () {},
                    onSwipe: () {},
                    textOff : "Обычное тесто",
                    textOn : "Тонкое тесто",
                    colorOn : const Color(0xffFFFFFF),
                    colorOff : const Color(0xf0FFFFFF),
                    background : const Color(0xffe4e5eb),
                    buttonColor : const Color(0xff0079D0),
                    inactiveColor : const Color(0xff636f7b),
                  ),
                ),

                // выбор размера пиццы
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 300,
                    child: SfSlider(
                      min: 20, max: 60,
                      value: _pizzaSize,
                      interval: 20,
                      showTicks: true,
                      showLabels: true,
                      numberFormat: NumberFormat('## см'),
                      enableTooltip: false,
                      minorTicksPerInterval: 0,
                      stepSize: 20,
                      onChanged: ( dynamic value){
                        setState(() {
                          _pizzaSize=value;
                          _calcCoast();
                        });
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),

                SizedBox(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only( top: 5, left: 20),
                    child: const Text('Соус',
                        style: TextStyle(fontSize: 18,color: Color(0xFF000000))),
                  ),
                ),
                RadioListTile<Sauce>(
                  title: const Text('Острый'),
                  value: Sauce.hot,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                  visualDensity: const VisualDensity(horizontal: 0, vertical: - 4.0),
                ),
                RadioListTile<Sauce>(
                  title: const Text('Кисло-сладкий'),
                  value: Sauce.sweet,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                ),
                RadioListTile<Sauce>(
                  title: const Text('Сырный'),
                  value: Sauce.cheese,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                ),
                RadioListTile<Sauce>(
                  title: const Text('Чесночный'),
                  value: Sauce.garlic,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                  visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                ),

                //Дополнительный сыр

                SizedBox(
                  width: 300,
                  child: Card(
                    elevation: 0,
                    color: Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 20,),
                          child: SizedBox(
                            width: 38,
                            height: 56,
                          ),
                        ),
                        const Text('Дополнительный сыр',
                            style: TextStyle (fontSize: 16, color: Color(0xFF263238))),
                        Switch(
                            value:_addCheese ,
                            onChanged: (bool value){
                              setState(() {
                                _addCheese = value;
                                _calcCoast();
                              });
                            }),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: 350,
                  child: Card(
                    elevation: 0,
                    color: Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 20,),
                          child: SizedBox(
                            width: 38,
                            height: 56,
                          ),
                        ),
                        const Text('Дополнительный чеснок',
                            style: TextStyle (fontSize: 16, color: Color(0xFF263238))),
                        Switch(
                            value:_addgarlic  ,
                            onChanged: (bool value){
                              setState(() {
                                _addgarlic  = value;
                                _calcCoast();
                              });
                            }),
                      ],
                    ),
                  ),
                ),

                // Итоговая стоимость
                Container(
                  //color: Theme.of(context).colorScheme.secondary,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text('Стоимость: ',
                      style: TextStyle(fontSize: 18,color: Color (0xFFF0F0F0))),
                ),

                // Цена в строке
                SizedBox(
                  width: 300,
                  height: 50,

                  child: Card(
                    elevation: 0,
                    color: const Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('${_calcCoast()} руб. ',
                        style: const TextStyle(fontSize: 32, color: Color(0xFF000000)),
                        textAlign: TextAlign.center
                    ),
                  ),

                ),
                SizedBox(width: 154, height: 42,child:
                ElevatedButton(onPressed: () =>
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: Colors.orange,
                        title: const Text('Подтвердите заказ ?'),
                        //content: _calcCoast (),
                        actions: <Widget>[
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            ),
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Отменить'),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            ),
                            onPressed: () => {
                              Navigator.pop(context, 'OK'),
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Ваш заказ оформлен. Спасибо за заказ!')))
                            },
                            child: const Text('Заказать'),
                          ),
                        ],
                      ),
                    ),
                /*{Navigator.pushNamed(context, '//second');},*/
                  child: Text('Сделать заказ'),
                  style: ElevatedButton.styleFrom(
                    primary:   Colors.orangeAccent,
                    shape: RoundedRectangleBorder(   //тип кнопки - скругленный прямоугольник
                      borderRadius: BorderRadius.circular(36.0), // радиус скругления
                    ),
                  ),
                ),
                ),

                const SizedBox(
                  height: 40,
                ),

                SizedBox(
                  width: 156,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
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
                onPressed: () {Navigator.pushNamed(context, '//second');},
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
                onPressed: () { Navigator.pushNamed(context, '//second');},
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



