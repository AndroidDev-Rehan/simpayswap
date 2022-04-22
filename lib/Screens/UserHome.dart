import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simpayswap/Screens/Drawer/Drawer.dart';
import 'package:simpayswap/Screens/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserHOme extends StatelessWidget {
   UserHOme({Key? key}) : super(key: key);


  CollectionReference users=FirebaseFirestore.instance.collection('user');
  String name="";

  @override
  Widget build(BuildContext context) {
    return  Container(
          alignment: Alignment.center,
          child: Text("Welcome to Dashboard")
      );


  }
}
