import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {


  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();



  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    hintText: "phone"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    hintText: "email"),
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
              SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email.text,
                    password: pass.text,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              }, child: Text("signup")),
              ElevatedButton(onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text,
                      password: pass.text
                  ).then((value) {
                    print("===${value}");
                  });
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              }, child: Text("Login"))
            ]),
          ),
        ),
      ),
    );
  }
}
