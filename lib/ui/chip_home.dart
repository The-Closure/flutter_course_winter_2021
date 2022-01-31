import 'package:flutter/material.dart';

class ChipHome extends StatefulWidget {
  const ChipHome({Key? key}) : super(key: key);

  @override
  State<ChipHome> createState() => _ChipHomeState();
}

class _ChipHomeState extends State<ChipHome> {
  List<bool> chips = [true, false, false, true, false];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Choice Chips Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Choice Chips Demo'),
        ),
        body: Center(
          child: Column(
            children: [
              for (var i = 0; i < 5; i++)
                ChoiceChip(
                  label: Text('choice $i'),
                  selected: chips[i],
                  onSelected: (value) {
                    setState(() {
                      chips.fillRange(0, chips.length, false);
                      chips[i] = value;
                    });
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
