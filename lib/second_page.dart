import 'package:flutter/material.dart';
import 'package:flutter_course_winter_2021/data_service.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(100),
        child: Column(
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
                  width: 400,
                  color: Colors.indigo,
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(seconds: 5),
              color: Colors.red,
              width: 200,
              height: 200,
              child: StreamBuilder(
                builder: (ctxt, snapData) => Text(
                  snapData.data.toString(),
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                stream: DataService().getStream(),
                initialData: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
