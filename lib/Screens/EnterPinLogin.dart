import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpayswap/Authentication/biometric_auth.dart';
import 'package:simpayswap/Constants/myStrings.dart';
import 'package:simpayswap/Screens/Login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simpayswap/main.dart';
import '../PIN Widgets/Verify.dart';




class EnterPinLogin extends StatefulWidget {
  @override
  State<EnterPinLogin> createState() => _EnterPinLoginState();



}

class _EnterPinLoginState extends State<EnterPinLogin> {
  double height=0;

  final _txtPin=TextEditingController();


  late String pin;
  String get(){

    return pin;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightWhite,
        title: Text("Enter Your PIN",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
          } ,
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
      ),
      body: Verify((val)async{


       String pin=await pref.getPref(myStrings.pin);
       if(val==pin) {

         Get.offAll(()=> BiometricAuth());

       }
       else{
         _txtPin.clear();
         Fluttertoast.showToast(msg: "Enter Correct Pin",gravity: ToastGravity.CENTER);
       }

        print(val);
        setState(() {

        });
      },


          this._txtPin,
          "Enhance the Security of the account by verifying your PIN"
      ),
    );
  }
}