import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyStorage extends StatefulWidget {
  const MyStorage({Key? key}) : super(key: key);

  @override
  State<MyStorage> createState() => _MyStorageState();
}

class _MyStorageState extends State<MyStorage> {
  String imagee = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            InkWell(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();
// Pick an image.
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    imagee = image!.path;
                  });
                },
                child: CircleAvatar(
                  backgroundImage: FileImage(File(imagee)),
                )),
            ElevatedButton(
                onPressed: () async {
                  final storageRef = FirebaseStorage.instance.ref();

                  String imagename = "Image${DateTime.now().second}.jpg";

                  final spaceRef = storageRef.child("ShrutiImagess/${imagename}");

                  await spaceRef.putFile(File(imagee));
                  spaceRef.getDownloadURL().then((value) async {
                    print("====${value}");

                    DatabaseReference ref = FirebaseDatabase.instance.ref("Mydata").push();

                  String? id = ref.key;

                    await ref.set({
                      "id":id,
                      "name": "John1",
                      "imageurl" : value
                    });

                  });

                },
                child: Text("Submit Image To Firebase"))
          ],
        ),
      ),
    );
  }
}
