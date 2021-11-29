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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(8),
                width: double.infinity,
                height: 200,
                color: Colors.indigo),
            Container(
                margin: EdgeInsets.all(8),
                width: double.infinity,
                child: Icon(
                  Icons.add_comment_sharp,
                  color: Colors.white,
                  size: 32,
                  // semanticLabel: 'message',
                ),
                height: 200,
                color: Colors.indigo),
            Container(
                child: Image.asset(
                  'images/nature.jpg',
                  fit: BoxFit.cover,
                ),
                margin: EdgeInsets.all(8),
                width: double.infinity,
                height: 400,
                color: Colors.indigo),
            Container(
                child: Image.network(
                  'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmlld3xlbnwwfHwwfHw%3D&w=1000&q=80',
                  fit: BoxFit.fill,
                ),
                margin: EdgeInsets.all(8),
                width: double.infinity,
                height: 400,
                color: Colors.indigo),
          ],
        ),
      ),
    );
  }
}
