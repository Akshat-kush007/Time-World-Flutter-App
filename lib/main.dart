import 'package:flutter/material.dart';
import 'pages/loading.dart';
import 'pages/location.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Time World",
      debugShowCheckedModeBanner: false,
      initialRoute:'/',
      routes: {
        '/':(context) => Loading(), 
        '/home':(context) => Home(), 
        '/location':(context) => Location(), 
      },
    );
  }
}
