import 'package:flutter/material.dart';
import 'package:flutter_course_winter_2021/data_service.dart';
import 'package:flutter_course_winter_2021/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimatedAlign(
            alignment: Alignment.topLeft,
            curve: Curves.easeInOutBack,
            duration: Duration(seconds: 5),
            child: Hero(
              tag: 'AnCon',
              child: Container(
                height: 100,
                width: 100,
                color: Colors.indigo,
              ),
            ),
          ),
          AnimatedContainer(
              duration: Duration(seconds: 5),
              color: Colors.red,
              width: 200,
              height: 200,
              alignment: Alignment.center,
              child: FutureBuilder(
                initialData: 0,
                builder: (ctxt, snapData) => Text(
                  snapData.data.toString(),
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                future: DataService().getValue(),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SecondPage()));
      }),
    );
  }
}
