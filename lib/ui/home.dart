import 'package:flutter/material.dart';
import 'package:flutter_course_winter_2021/untils/local_storage.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController inputControl = TextEditingController();
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: inputControl,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'write data ...'),
                  ),
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        LocalStorage localStorage = LocalStorage();
                        localStorage.addData(inputControl.text);
                        inputControl.clear();
                      },
                      child: Text('Add data'),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    TextButton(
                      child: Text('show data'),
                      onPressed: () {
                        showBottomSheet(
                          // isDismissible: false,
                          context: ctxt,
                          builder: (context) {
                            return FutureBuilder(
                                future: LocalStorage().getData(),
                                builder:
                                    (context, AsyncSnapshot asyncSnapshot) {
                                  if (asyncSnapshot.hasData) {
                                    List<String> data = asyncSnapshot.data;
                                    return Column(
                                      children: [
                                        Expanded(
                                          child: Hero(
                                            tag: '1',
                                            child: ListTile(
                                                title: Text('Header',
                                                    style: TextStyle(
                                                        fontSize: 24)),
                                                tileColor: Colors.indigo),
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: ListView.builder(
                                              itemCount: data.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  title: Text('${data[index]}'),
                                                );
                                              }),
                                        ),
                                      ],
                                    );
                                  } else
                                    return CircularProgressIndicator();
                                });
                          },
                        );
                      },
                    ),
                  ],
                )),
              ],
            );
          },
        ));
  }
}
