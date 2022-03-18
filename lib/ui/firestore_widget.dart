import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_course_winter_2021/models/firestore_user_model.dart';
import 'package:flutter_course_winter_2021/services/firestore_service.dart';

class AddUser extends StatelessWidget {
  TextEditingController ageEditingController = TextEditingController();
  TextEditingController companyEditingController = TextEditingController();
  TextEditingController fullNameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    return Column(
      children: [
        TextField(
          decoration: InputDecoration(hintText: 'age'),
          controller: ageEditingController,
        ),
        TextField(
          decoration: InputDecoration(hintText: 'company'),
          controller: companyEditingController,
        ),
        TextField(
          decoration: InputDecoration(hintText: 'fullName'),
          controller: fullNameEditingController,
        ),
        TextButton(
          onPressed: () {
            FireStoreUser fireStoreUser = FireStoreUser(
                age: int.parse(ageEditingController.text),
                company: companyEditingController.text,
                fullName: fullNameEditingController.text);

            FirestoreService().addUser(fireStoreUser);
            ageEditingController.clear();
            companyEditingController.clear();
            fullNameEditingController.clear();
          },
          child: Text(
            "Add User",
          ),
        ),
      ],
    );
  }
}
