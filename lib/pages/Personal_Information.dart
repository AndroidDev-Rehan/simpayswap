import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:simpayswap/Authentication/FirebaseAuthentication.dart';
import 'package:simpayswap/Screens/Widgets.dart';

import 'document_verify_page.dart';

class Personal_Information extends StatelessWidget {
  Personal_Information({Key? key}) : super(key: key);

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final streetaddress = TextEditingController();
  final city = TextEditingController();
  final Zip_area_code=TextEditingController();
  final citizenship=TextEditingController();


  bool check = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor:   Color(0xffEDF1F9),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title:
        Text("Personal Information",style: TextStyle(color: Colors.black),),
      ),

      backgroundColor: Color(0xffEDF1F9),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(border: Border.all(
            style: BorderStyle.solid, width: 0, color: Colors.white)
          ,
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              newTextField(
                'First Name',
                '',
                firstName,
                null,
              ),
              SizedBox(height: 10,),
              newTextField(
                'Last Name',
                '',
                lastName,
                null,
              ),
              SizedBox(height: 10,),
              newTextField(
                'Street address',
                '',
                streetaddress,
                null,
              ),
              SizedBox(height: 10,),
              newTextField(
                'City',
                '',
                city,
                null,
              ),
              SizedBox(height: 10,),
              newTextField(
                'ZIP/Area code',
                '',
                Zip_area_code,
                null,
              ),
              SizedBox(height: 10,),
              newTextField(
                'Citizenship',
                '',
                citizenship,
                null,
              ),

              SizedBox(height: 150,),


              ElevatedButton(
                child: Padding(
                  padding:
                   EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  child: Text(
                    'Next  Step',
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
                        )
                    )
                ),
                onPressed: () {
                  Get.to(() => DocumentVerifyPage());
                },
              ),
            ],
          ),

        ),
      ),
    );
  }
}
