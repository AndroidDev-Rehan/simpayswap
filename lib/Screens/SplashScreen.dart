import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simpayswap/Authentication/biometric_auth.dart';
import 'package:simpayswap/Screens/EnterPinLogin.dart';
import 'package:simpayswap/Screens/OnBoard1.dart';
import 'package:simpayswap/Screens/UserHome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), _toNext);
  }
  void _toNext()
  {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FirebaseAuth.instance.currentUser!=null ? EnterPinLogin() : OnBoard1()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,

      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/spWhite.png"),
                fit: BoxFit.fill,
              )
            ),
          ),
        ],
      ),
    );
  }
}
