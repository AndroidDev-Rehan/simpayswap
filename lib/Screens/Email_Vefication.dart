import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      print('Verification Email has been sent');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Verification Email has been sent',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
          Text(
            'Created:\n $creationTime\n',textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            'User ID:\n $uid\n',textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '     Email:\n $email\n',
                //textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16.0),
              ),
              user!.emailVerified
                  ? Text(
                '  verified',
                style: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
              )
                  : TextButton(
                  onPressed: () => {verifyEmail()},
                  child: Text('Verify Email',
                   )),

            ],
          ),

        ],
      ),
    );
  }
}