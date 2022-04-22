import 'package:flutter/material.dart';
import 'package:simpayswap/Screens/ConfirmPin.dart';
import 'package:simpayswap/Screens/Login.dart';
import 'package:simpayswap/Screens/SignUp.dart';
import '../PIN Widgets/Verify.dart';




class EnterPin extends StatefulWidget {
  @override
  State<EnterPin> createState() => _EnterPinState();
  

}

class _EnterPinState extends State<EnterPin> {
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
        title: Text("Create a PIN",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed:(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
          } ,
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
      ),
      body: Verify((val){



        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context)=>ConfirmPin(val)));

      print(val);
        setState(() {

        });
      },


       this._txtPin,
          "Enhance the Security of the account by creating the PIN"
      ),
    );
  }
}