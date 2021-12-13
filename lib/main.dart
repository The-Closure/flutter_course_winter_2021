import 'package:flutter/material.dart';
import 'package:flutter_course_winter_2021/first_page.dart';
import 'package:flutter_course_winter_2021/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'dismissPage': (_) => SecondPage(),
        'GesPage': (_) => FirstPage()
      },
      initialRoute: 'GesPage',
    );
  }
}
