import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:get/get.dart';
import 'package:simpayswap/Authentication/FirebaseAuthentication.dart';
import 'package:simpayswap/Authentication/biometric_auth.dart';
import 'package:simpayswap/Constants/myStrings.dart';
import 'package:simpayswap/PIN%20Widgets/Verify.dart';
import 'package:simpayswap/Screens/EnterPin.dart';
import 'package:simpayswap/Screens/UserHome.dart';
import 'package:simpayswap/main.dart';


class ConfirmPin extends StatefulWidget {
  String _val;
  ConfirmPin(this._val);
  @override
  State<ConfirmPin> createState() => _ConfirmPinState();


}

class _ConfirmPinState extends State<ConfirmPin> {
  double height=0;

  final _txtPin=TextEditingController();
  bool _isloading=false;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightWhite,
        title: Text("Confirm PIN",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder:
             (context)=>EnterPin()));
          } ,
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
      ),
      body:_isloading ? Center(child: CircularProgressIndicator(color: Colors.blue,),) : Verify((val)async{

        if(val==widget._val){
          try {
            _isloading=true;

           await showDialog(context: context,
               builder: (context)=>FutureProgressDialog(_setPin(val),message: Text("setting up... please wait"),));
           pref.setPref(myStrings.pin, val);
            _isloading=false;

            Get.offAll(()=>BiometricAuth());
          }on FirebaseException catch (e)
        {
          _isloading=false;
          setState(() {

          });
          Fluttertoast.showToast(msg: e.message.toString());
          _txtPin.clear();
        }

            // await FirebaseAuthentication().SignUp(widget.email,widget.password,widget.firstname,widget.lastname,val,context);

          }
        else
          {

            Fluttertoast.showToast(msg: "Pin not matched Enter Again");
            Navigator.pushReplacement(context, MaterialPageRoute(builder:
                (context)=>EnterPin()));

          }
        setState(() {



        });

      },

        this._txtPin,
          "Repeat a PIN code to continue"
      ),
    );
  }
  Future<void> _setPin(String val)async
  {
    await FirebaseDatabase.instance.ref("users").child(
        FirebaseAuth.instance.currentUser!.uid)
        .child(myStrings.pin)
        .set(val);
  }
}