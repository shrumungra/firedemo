import 'package:flutter/material.dart';

class Otp extends StatelessWidget {
  TextEditingController phone = TextEditingController();
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            children: [
              TextField(
                controller: phone,
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
                controller: otp,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    hintText: "enter otp"),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: () {}, child: Text("phone submit")),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(onPressed: () {}, child: Text("submit"))
            ],
        ),
      ),
          )),
    );
  }
}
