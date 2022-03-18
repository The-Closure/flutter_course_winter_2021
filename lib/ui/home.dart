import 'package:flutter/material.dart';
import 'package:flutter_course_winter_2021/models/firestore_user_model.dart';
import 'package:flutter_course_winter_2021/services/firestorage_service.dart';
import 'package:flutter_course_winter_2021/services/firestore_service.dart';
import 'package:flutter_course_winter_2021/ui/firestore_widget.dart';
import 'package:flutter_course_winter_2021/untils/local_storage.dart';

import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? url;
  TextEditingController inputControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.upload_file),
          onPressed: () async {
            ImagePicker imagePicker = ImagePicker();
            XFile? file =
                await imagePicker.pickImage(source: ImageSource.gallery);
            url = await FirestorageService().uploadImage(file!.path);

            setState(() {
              url = url;
            });
          },
        ),
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
                url != null
                    ? Image.network(
                        '$url',
                        height: 100,
                        width: 100,
                      )
                    : Image.asset(
                        'images/nature.jpg',
                        height: 100,
                        width: 100,
                      ),
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
                AddUser(),
                TextButton(
                  child: Text('show firestore data'),
                  onPressed: () {
                    showBottomSheet(
                      // isDismissible: false,
                      context: ctxt,
                      builder: (context) {
                        return FutureBuilder(
                            future: FirestoreService().getDocs(),
                            builder: (context, AsyncSnapshot asyncSnapshot) {
                              if (asyncSnapshot.hasData) {
                                List<Map<String, dynamic>> data =
                                    asyncSnapshot.data;
                                return ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (item, index) => ListTile(
                                          leading:
                                              Text(data[index]['full_name']),
                                          title: Text('firestore full_name'),
                                        ));
                              } else
                                return CircularProgressIndicator();
                            });
                      },
                    );
                  },
                ),
              ],
            );
          },
        ));
  }
}
