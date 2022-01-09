import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

class PizzaCalcScreen extends StatefulWidget {
  const PizzaCalcScreen({Key? key}) : super(key: key);

  @override
  _PizzaCalcScreenState createState() => _PizzaCalcScreenState();
}

enum Sauce {hot, sweet,cheese,garlic}

class _PizzaCalcScreenState extends State<PizzaCalcScreen> {

  bool _isSlimDoufht = false;
  double _pizzaSize = 20;
  int _coast = 100;
  Sauce? _sauce = Sauce.hot;
  bool _addCheese = true;
  bool _addgarlic = false;

  int _calcCoast (){
    _coast = _pizzaSize.round()+100;

    if (_isSlimDoufht == true) _coast += 30;
    if (_addCheese == true) _coast+= 50;
    if (_addgarlic == true ) _coast+= 70;

    switch (_sauce){
      case Sauce.hot:
        _coast+=10;
        break;
      case Sauce.sweet:
        _coast+=20;
        break;
      case Sauce.cheese:
        _coast+=40;
        break;
      case Sauce.garlic:
        _coast+=60;
        break;

      case null :
        _sauce = Sauce.hot;
        break;


    }
    return _coast;
  }

  void _onSauceChanged ( Sauce? value){
    setState(() {
      _sauce = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Calc_pizza_Image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 62,
              ),
              SizedBox(
                height: 100,
                //child: Image.asset(name),
              ),

              const Text('Создай свой вкус',
                style: TextStyle(fontSize:36,color: Colors.white ),),
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
    );
  }
}
