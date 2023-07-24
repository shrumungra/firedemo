import 'package:firebase_core/firebase_core.dart';
import 'package:firedemo/otp.dart';
import 'package:firedemo/register.dart';
import 'package:flutter/material.dart';

import 'StorageImage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(MaterialApp(
    home: MyStorage(),
  ));
}

class firebase extends StatefulWidget {
  const firebase({Key? key}) : super(key: key);
  @override
  State<firebase> createState() => _firebaseState();
}

class _firebaseState extends State<firebase> {


  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              TextField(
                controller: phone,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    hintText: "phone"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: pass,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    hintText: "password"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return register();
                      },
                    ));
                  },
                  child: Text("sign up")),
              SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Otp();
                      },
                    ));
                  },
                  child: Text("otp")),
              ElevatedButton(onPressed: () {}, child: Text("signin"))
            ]),
          ),
        ),
      ),
    );
  }
}
