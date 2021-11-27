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
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: (MediaQuery.of(context).size.height / 2) - (75 / 2),
            // padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlutterLogo(
                  size: 50,
                  textColor: Colors.red,
                  duration: Duration(seconds: 5),
                  curve: Curves.easeInToLinear,
                ),
                SizedBox(
                  height: 500,
                ),
                FlutterLogo(
                  size: 50,
                  textColor: Colors.red,
                  duration: Duration(seconds: 5),
                  curve: Curves.easeInToLinear,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            // padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .center, // don't use stretch when using space* in row main axis alignment
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlutterLogo(
                  size: 50,
                  textColor: Colors.red,
                  duration: Duration(seconds: 5),
                  curve: Curves.easeInToLinear,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.red,
            height: (MediaQuery.of(context).size.height / 2) - (75 / 2),

            // padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlutterLogo(
                  size: 50,
                  textColor: Colors.red,
                  duration: Duration(seconds: 5),
                  curve: Curves.easeInToLinear,
                ),
                FlutterLogo(
                  size: 50,
                  textColor: Colors.red,
                  duration: Duration(seconds: 5),
                  curve: Curves.easeInToLinear,
                ),
                FlutterLogo(
                  size: 50,
                  textColor: Colors.red,
                  duration: Duration(seconds: 5),
                  curve: Curves.easeInToLinear,
                ),
                Spacer(),
                FlutterLogo(
                  size: 50,
                  textColor: Colors.red,
                  duration: Duration(seconds: 5),
                  curve: Curves.easeInToLinear,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
