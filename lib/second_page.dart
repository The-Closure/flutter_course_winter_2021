import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course_winter_2021/first_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool dismissDecision = true;

  List<String> data = [
    'flutter',
    'dart',
    'bloc',
    'ui',
    'firebase',
    'github',
    'gitlab'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.preview),
          onPressed: () {
            Navigator.of(context).pop('you backed from dimissPage');
          },
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (ctxt, index) => Dismissible(
          confirmDismiss: (direction) {
            return Future.delayed(
                Duration(milliseconds: 1), () => dismissDecision);
          },
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              print('deleteing item with index : $index');
              data.removeAt(index);
            } else if (direction == DismissDirection.endToStart) {
              print('archiving item $index');
              data.removeAt(index);
            }
          },
          secondaryBackground: Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.centerRight,
            color: Colors.green,
            child: Icon(
              Icons.note,
              size: 32,
              color: Colors.white,
            ),
          ),
          background: Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            color: Colors.red,
            child: Icon(
              Icons.delete,
              size: 32,
              color: Colors.white,
            ),
          ),
          key: UniqueKey(),
          child: Container(
            margin: EdgeInsets.all(16),
            color: Colors.indigo,
            alignment: Alignment.center,
            width: double.infinity,
            height: 75,
            child: Text(
              '${data[index]}',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            dismissDecision = !dismissDecision;
          });
        },
      ),
    );
  }
}
