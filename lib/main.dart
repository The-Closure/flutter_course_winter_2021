import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'ZARA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 30,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 1,
                      offset: Offset(10, 20),
                    ),
                    Shadow(
                      color: Colors.black,
                      blurRadius: 1,
                      offset: Offset(-10, -20),
                    ),
                  ],
                ),
              ),
            ),
            // color: Colors.indigo, // don't use with box decoration
            // width: 300,
            // height: 300,
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(16),
            // alignment: Alignment.center, don't use with center widget
            decoration: BoxDecoration(
              color: Colors.indigo,
              border: Border.all(
                  color: Colors.black, style: BorderStyle.solid, width: 6),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
