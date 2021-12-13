import 'dart:math';

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int i = 0;
  double prevScale = 0;
  double width = 200;
  double height = 200;
  double initWidth = 200;
  double initHeight = 200;
  double prevHeight = 0;
  double prevWidth = 0;

  Color _background = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            print('$i');
            setState(() {
              i++;
            });
          },
          onDoubleTap: () {
            print('$i');
            setState(() {
              i += 2;
            });
          },
          onLongPress: () {
            var red = Random().nextInt(255);
            var green = Random().nextInt(255);
            var blue = Random().nextInt(255);

            setState(() {
              _background = Color.fromARGB(255, red, green, blue);
            });
          },
          onScaleUpdate: (details) {
            prevHeight = height;
            prevWidth = width;
            setState(() {
              if (details.scale > prevScale) {
                width = (details.scale * 10) + prevScale + initWidth;
                height = (details.scale * 10) + prevScale + initWidth;
              } else {
                {
                  width = (details.scale * 10) - prevScale + initWidth;
                  height = (details.scale * 10) - prevScale + initWidth;
                }
              }
            });
            prevScale = details.scale;
          },
          onScaleEnd: (details) {
            setState(() {
              height = prevHeight;
              width = prevWidth;
            });
          },
          onLongPressEnd: (details) async {
            // Navigator.of(context).pushNamed('dismissPage'); // WILL EFFECT APP BAR WITH BACK BUTTON
            // Navigator.of(context).popAndPushNamed('dismissPage'); // // WILL EFFECT APP BAR WITH BACK BUTTON
            var value = await Navigator.of(context).pushNamed(
              'dismissPage',
            ) as String;
            print(value);
          },
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            color: _background,
            child: Text(
              '$i',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            i++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
