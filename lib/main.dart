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
  Home({Key? key}) : super(key: key);
  List<String> langs = [
    'java',
    'flutter',
    'scala',
    'kotlin',
    'ruby',
    'cpp',
    'cs',
    'js',
    'go',
    'py',
    'vue'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Text('data'),
              width: double.infinity,
              height: double.minPositive,
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 0.5),
              scrollDirection: Axis.vertical,
              itemCount: langs.length,
              itemBuilder: (ctxt, index) {
                return Container(
                  margin: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  color: Colors.indigo,
                  width: 100,
                  child: Text(
                    langs[index],
                    // overflow: TextOverflow.visible,
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
