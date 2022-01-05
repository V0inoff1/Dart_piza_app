import 'package:flutter/material.dart';

void main() {
  runApp(const AuthScreen());
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
        color: Color(0xFF0079D0)
    );

    return MaterialApp(
      home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 50),// симетричное расположение колонки при любой ореентации экрана
            child: SingleChildScrollView(
              child: Column(children:  [
                SizedBox(height: 150,),
                SizedBox(width: 110.02,height: 83.78,child: Placeholder (),),
                SizedBox(height: 20,),
                Text('Введите логин в виде 10 цифр номера телефона',
                  style: TextStyle(fontSize:16,color: Color.fromRGBO(0, 0, 0, 0.6)),),
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
                    labelText: 'Login',
                  ),
                ),
                SizedBox(height: 28,),
                SizedBox(width: 154, height: 42,child:
                 ElevatedButton(onPressed: () {},
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
                InkWell(child: Text('Регистрация',
                  style: linkTextStyle),onTap: () {} ),
                SizedBox(height: 20,),
                InkWell(child: Text('Забыли пароль?',style: linkTextStyle),onTap: () {}),

              ],),
            ),
          )
      ),
    );
  }
}

