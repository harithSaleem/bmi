import 'package:bmi/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 45.0,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27.0,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27.0,
            color: Colors.white,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
