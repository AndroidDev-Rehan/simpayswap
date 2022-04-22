import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simpayswap/Constants/myStrings.dart';
import 'package:simpayswap/Screens/EnterPinLogin.dart';
import 'package:simpayswap/Screens/UserHome.dart';
import 'package:simpayswap/main.dart';

class FirebaseAuthentication
{
  bool check=false;
  final mAuth=FirebaseAuth.instance;
  Future<bool> login(String email,String pass)async
  {
    try{
      UserCredential user=await mAuth.signInWithEmailAndPassword(email: email, password: pass);

      final ref=await FirebaseDatabase.instance.ref("users").child(FirebaseAuth.instance.currentUser!.uid);
      print("clicked");
      await ref.once().then((data){
        if(data.snapshot.value!=null) {
          Map values = data.snapshot.value as Map;
          pref.setPref(myStrings.firstname, values[myStrings.firstname]);
          pref.setPref(myStrings.lastname, values[myStrings.lastname]);
          pref.setPref(myStrings.email, values[myStrings.email]);
          pref.setPref(myStrings.pin, values[myStrings.pin]);
          print(values[myStrings.email]);

        }
      } );




        return true;
    }on FirebaseAuthException catch(e)
    {
      Get.snackbar("Error", e.message.toString(),backgroundColor: Colors.blue.shade700.withOpacity(0.6),colorText: Colors.white);
       return false;
    }catch(e)
    {
      print(e.toString());
      return false;
    }
  }


  Future<bool> SignUp(String email1, String password1,String firstName,String lastName)async
  {
    try {
      UserCredential result = await mAuth.createUserWithEmailAndPassword(email: email1, password: password1);
      User user=result.user !;

      final ref=FirebaseDatabase.instance.ref("users");
      await ref.child(user.uid).set({
        myStrings.firstname:firstName,
        myStrings.lastname:lastName,
        myStrings.email:email1,
        myStrings.pin:"0000",
      });
      pref.setPref(myStrings.firstname, firstName);
      pref.setPref(myStrings.lastname, lastName);
      pref.setPref(myStrings.email, email1);


      Fluttertoast.showToast(msg: "Signup Successfully",toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.CENTER,);
      return true;
    }on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.message.toString(),toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM);
      return false;
    }
  }

}
