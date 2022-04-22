import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:passbase_flutter/passbase_flutter.dart';
import 'package:simpayswap/FirebaseService/FirebaseService.dart';
class PassbaseVerification extends StatefulWidget {
  @override
  _PassbaseVerificationState createState() {
    return _PassbaseVerificationState();
  }
}

class _PassbaseVerificationState extends State<PassbaseVerification> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 107, 236),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: Image.asset(
                'assets/SimpySwap.png',
                width: 100,
                height: 100,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: <Widget>[
                  Text(
                    'Welcome to SimpaySwap',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Start your first verification by clicking on the button below.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontFamily: 'Exo2',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: PassbaseButton(
                onFinish: (identityAccessKey)async {
                  // do stuff in case of success
                  await showDialog(context: context,
                      builder: (context)=>FutureProgressDialog( FirebaseService().setVerificationKey(identityAccessKey),message: Text("Setting up"),));
                },
                onError: (errorCode) {
                  // do stuff in case of cancel
                  print(errorCode);
                },
                onStart: () {
                  // do stuff in case of start
                  print("start");
                },
                width: 300,
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}