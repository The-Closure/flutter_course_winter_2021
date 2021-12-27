import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_winter_2021/bloc/auth_bloc.dart';
import 'package:flutter_course_winter_2021/ui/home.dart';
import 'package:flutter_course_winter_2021/ui/sign_in.dart';

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
      },
      initialRoute: '/signIn',
    );
  }
}
