import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Hero(
          tag: '1',
          child: BottomAppBar(
            color: Colors.indigo,
            child: Container(
              height: 50,
            ),
          ),
        ),
        body: Builder(
          builder: (ctxt) {
            return Center(
                child: TextButton(
              child: Text('click me'),
              onPressed: () {
                showBottomSheet(
                  // isDismissible: false,
                  context: ctxt,
                  builder: (context) {
                    return Scaffold(
                      body: Wrap(
                        children: [
                          Hero(
                            tag: '1',
                            child: ListTile(
                                title: Text('Header',
                                    style: TextStyle(fontSize: 24)),
                                tileColor: Colors.indigo),
                          ),
                          ListTile(
                            title: Text('Title 1'),
                          ),
                          ListTile(
                            title: Text('Title 2'),
                          ),
                          ListTile(
                            title: Text('Title 3'),
                          ),
                          ListTile(
                            title: Text('Title 4'),
                          ),
                          ListTile(
                            title: Text('Title 5'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ));
          },
        ));
  }
}
