import 'package:flutter/material.dart';
import 'package:flutter_course_winter_2021/first_page.dart';
import 'package:flutter_course_winter_2021/models/auth_model.dart';
import 'package:flutter_course_winter_2021/models/token_model.dart';
import 'package:flutter_course_winter_2021/second_page.dart';
import 'package:flutter_course_winter_2021/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding();

  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //example comment anas edit
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
