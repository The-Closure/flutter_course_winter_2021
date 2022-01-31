import 'package:flutter/material.dart';

class SwitchHome extends StatefulWidget {
  SwitchHome({Key? key}) : super(key: key);

  @override
  State<SwitchHome> createState() => SwitchHomeState();
}

class SwitchHomeState extends State<SwitchHome> {
  List<bool> checked = [true, true, false, false, true, false];
  int? _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: <Widget>[
          for (int i = 0; i <= 5; i++)
            ListTile(
              title: Text(
                'Switch ${i + 1}',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: i == 5 ? Colors.black38 : Colors.black),
              ),
              leading: Switch(
                value: checked[i],
                activeColor: Color(0xFF6200EE),
                onChanged: i == 5
                    ? null
                    : (bool value) {
                        setState(() {
                          checked[i] = value;
                        });
                      },
              ),
            ),
        ],
      )),
    );
  }
}
