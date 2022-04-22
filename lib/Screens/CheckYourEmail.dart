import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'Login.dart';
import 'Widgets.dart';

class CheckYourEmail extends StatelessWidget {
  CheckYourEmail(this._email);

  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Check Your Email',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffEDF1F9),
        elevation: 0,
      ),
      backgroundColor: Color(0xffEDF1F9),
      body:
      Stack(
        children: [
          Positioned(
            top: 20,
           // bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Text(
                "Follow a password recovery instruction we\nhave just sent to your email address.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Positioned(
            top: 110,
           // bottom: 300,
            left: 20,
            right: 20,

            child: Image.asset(
              'assets/illustration-email.png',
            ),
          ),
          Positioned(
          //  top: 570,
            bottom: 90,
            left: 70,
            right: 70,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff347AF0)),
                    color: Color(0xff347AF0),
                    borderRadius: BorderRadius.circular(30)),
               // margin: EdgeInsets.only(top: 25, bottom: 20),
                 padding:
                     EdgeInsets.symmetric(vertical: 10),
                child:
                Center(
                  child: Text("Back to Login",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ),
          ),
          Positioned(
            //top: 650,
            bottom: 40,
            left: 70,
            right: 70,
            child: InkWell(
              onTap: () async {
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _email);
                  Get.snackbar('', 'Email Resend ',
                      backgroundColor: Colors.blue.shade700.withOpacity(0.5),
                      colorText: Colors.white);
                } on FirebaseAuthException catch (e) {
                  print(e.message);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff347AF0)),
                    color: Color(0xff347AF0),
                    borderRadius: BorderRadius.circular(30)),
               // margin: EdgeInsets.only(top: 25, bottom: 20),
                padding:
                EdgeInsets.symmetric(vertical: 10),
                child:
                  Center(
                    child: Text("Resend Email",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
