import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_course_winter_2021/models/firestore_user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirestorageService {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<String> uploadImage(String path) async {
    File file = File(path);
    try {
      int i = Random(0).nextInt(100);
      await firebase_storage.FirebaseStorage.instance
          .ref('$i file-to-upload.png')
          .putFile(file);

      return await firebase_storage.FirebaseStorage.instance
          .ref('$i file-to-upload.png')
          .getDownloadURL();
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
