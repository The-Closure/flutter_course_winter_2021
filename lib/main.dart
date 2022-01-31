import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_winter_2021/bloc/auth_bloc.dart';
import 'package:flutter_course_winter_2021/ui/chip_home.dart';
import 'package:flutter_course_winter_2021/ui/home.dart';
import 'package:flutter_course_winter_2021/ui/radio_home.dart';
import 'package:flutter_course_winter_2021/ui/sign_in.dart';
import 'package:flutter_course_winter_2021/ui/switch_home.dart';

void main() async {
  WidgetsFlutterBinding();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/signIn': (_) => SignIn(),
        '/home': (_) => Home(),
        '/radio_home': (_) => RadioHome(),
        '/switch_home': (_) => SwitchHome(),
        '/chip_home': (_) => ChipHome(),
      },
      initialRoute: '/chip_home',
    );
  }
}
