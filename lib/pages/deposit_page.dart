import 'package:passbase_flutter/passbase_flutter.dart';
import 'package:simpayswap/ApiManager/PassbaseApi.dart';
import 'package:simpayswap/Screens/PassbaseVerification.dart';
import 'package:simpayswap/controller/VerificationController.dart';
import 'package:simpayswap/pages/document_verify_page.dart';
import 'package:simpayswap/widgets/custom_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepositPage extends StatelessWidget {
  var c=Get.put(VerificationController("1fc90d26-2c20-4b14-a79f-9bf9c69bfaed"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "This is a place where you can find your deposited assets. Let's go through your first deposit!",
                textAlign: TextAlign.center,
                style: TextStyle(height: 1.5),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              child: Image.asset(
                'assets/images/p1.png',
                fit: BoxFit.cover,
              ),
            ),
            GetX<VerificationController>(

              builder: (verControler) {
               if(verControler.isLoading.isTrue) {
                 return Padding(
                   padding: const EdgeInsets.symmetric(vertical: 10),
                   child: Center(child: CircularProgressIndicator(
                     color: Colors.blue.shade700,),),
                 );
               }
               else if (verControler.status.value!="approved") {
                 return _Button(
                   "Start Verification",
                       ()async {
                         await PassbaseSDK.initialize(publishableApiKey: "fIdCjstXgaN5wP8HkgsmZ3UCHuuoYORyH52trJsadzJQbLVPDZsIIoq9KJeIiuvf");
                         PassbaseSDK.prefillUserEmail = "fadiktk001m@gmail.com"; //optional
                         Get.to(()=>PassbaseVerification());
                       },
                 );
               }
               return _Button(
                 "Deposite Coins",
                   (){},
               );
              }
            )
          ],
        ),
      ),
    );
  }
  Widget _Button(String txt,var ontap)
  {
    return Container(
      child: ElevatedButton(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          child: Text(
            txt,
            style: TextStyle(
              fontFamily: 'Exo2',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ))),
        onPressed: ontap
      ),
    );
  }
}
