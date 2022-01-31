import 'package:flutter/material.dart';

class RadioHome extends StatefulWidget {
  RadioHome({Key? key}) : super(key: key);

  @override
  State<RadioHome> createState() => _RadioHomeState();
}

class _RadioHomeState extends State<RadioHome> {
  List<bool?> checked = [true, true, false, false, true, false];
  int? _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            for (int i = 1; i <= 5; i++)
              ListTile(
                title: Text(
                  'Radio $i',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: i == 5 ? Colors.black38 : Colors.black),
                ),
                leading: Radio(
                  value: i,
                  groupValue: _value,
                  activeColor: Color(0xFF6200EE),
                  onChanged: i == 5
                      ? null
                      : (int? value) {
                          setState(() {
                            _value = value;
                          });
                        },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
