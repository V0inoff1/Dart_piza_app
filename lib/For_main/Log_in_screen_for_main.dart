
import 'package:flutter/material.dart';

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
                      Text('Чтобы зарегистрироваться введите свой номер телефона и почту',
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
            ],// Тело основного виджета
            ),
          ),
        ),
      ),
    );
  }
}

