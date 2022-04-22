import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpayswap/Authentication/FirebaseAuthentication.dart';

import 'CheckYourEmail.dart';
import 'Widgets.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();

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
          'Forgot Password?',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffEDF1F9),
        elevation: 0,
      ),
      backgroundColor: Color(0xffEDF1F9),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Text(
                "Enter your registrated email address to receive\npassword reset instruction",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Positioned(
            top: 145,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    style: BorderStyle.solid, width: 0, color: Colors.white),
                color: CupertinoColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: <Widget>[
                  newTextField(
                    'Email address',
                    'name@email.com',
                    emailController,
                    Icon(
                      Icons.email,
                    ),
                  ),

                  InkWell(
                    onTap: () async {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: emailController.text);
                        Get.to(() => CheckYourEmail(emailController.text));
                        Get.snackbar(
                            '', 'Email Send ',
                            backgroundColor:
                            Colors.blue.shade700.withOpacity(0.5),
                            colorText: Colors.white);

                      } on FirebaseAuthException catch (e) {
                        print(e.code);
                        if (e.code == "user-not-found")
                          Get.snackbar(
                              'Error', 'User With this email is not registered',
                              backgroundColor:
                                  Colors.blue.shade700.withOpacity(0.5),
                              colorText: Colors.white);
                        print(e.message);
                      }
                    },
                    child: Container(
                      // width: MediaQuery.of(context).size.width/2,

                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff347AF0)),
                          color: Color(0xff347AF0),
                          borderRadius: BorderRadius.circular(30)),
                      margin: EdgeInsets.only(top: 25, bottom: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text("Reset Password",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
