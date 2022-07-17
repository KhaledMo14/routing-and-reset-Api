import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/screen1.dart';
import 'package:flutter_application_3/screens/screen2.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Raleway'),
    initialRoute: '/',
    routes: {
      '/':(context) => Screen1(),
      '/screen2':(context) => Screen2(),
    },
  ));
}


