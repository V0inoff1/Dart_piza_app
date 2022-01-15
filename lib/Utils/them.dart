
import 'package:flutter/material.dart';

ThemeData globalTheme()=>ThemeData(
  fontFamily: 'Georgia',
  splashColor: Colors.yellow,// цвет вспышек

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: Colors.orange,
  ) .copyWith(
    secondary: Colors.green,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);

ThemeData Them1()=>ThemeData(
  fontFamily: 'Georgia',
  splashColor: Colors.red,// цвет вспышек

  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
  ) .copyWith(
    secondary: Colors.blue,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 10, color: Colors.red,fontFamily: 'Hind'),
  ),
);