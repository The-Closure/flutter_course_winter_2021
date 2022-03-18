import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_course_winter_2021/models/firestore_user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirestoreService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(FireStoreUser fireStoreUser) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'full_name': fireStoreUser.fullName, // John Doe
          'company': fireStoreUser.company, // Stokes and Sons
          'age': fireStoreUser.age // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<List<Map<String, dynamic>>> getDocs() async {
    QuerySnapshot usersSnapshot = await users.get();
    List<Map<String, dynamic>> result = usersSnapshot.docs.map((e) {
      Map<String, dynamic> data = Map();

      data['full_name'] = e.get('full_name') ?? 'null';

      return data;
    }).toList();
    return result;
  }
}
