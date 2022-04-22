import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'package:simpayswap/Authentication/FirebaseAuthentication.dart';
import 'package:simpayswap/Screens/EnterPin.dart';
import 'package:simpayswap/Screens/Login.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Widgets.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

   final firstName = TextEditingController();
   final lastName = TextEditingController();
   final emailController = TextEditingController();
  final passController = TextEditingController();
  String email = "";
  String pass = "";
  bool isPasswordVisible = true;
  bool check = false;
   bool _isLoading=false;

  void PasswordVisible() {
    if (isPasswordVisible == true) {
      isPasswordVisible = false;
    } else if (isPasswordVisible == false) {
      isPasswordVisible = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color:  Color(0xffEDF1F9),
          child: Column(
            children: [
              Container(
                color:  Color(0xffEDF1F9),
                margin: EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Image.asset("assets/ca_image.png"),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(border: Border.all(
                    style: BorderStyle.solid, width: 0, color: Colors.white)
                  ,
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          newTextField(
                            'First Name',
                            '',
                            firstName,
                            Icon(Icons.person),
                          ),
                          newTextField(
                            'Last Name',
                            '',
                            lastName,
                            Icon(Icons.person),
                          ),

                          newTextField(
                            'Email address',
                            'name@email.com',
                            emailController,
                            Icon(Icons.email),
                          ),

                          TextField(
                            controller: passController,
                            obscureText: isPasswordVisible,
                            decoration: InputDecoration(
                              labelText: "  Password",
                              // border: InputBorder.none,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: isPasswordVisible
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  PasswordVisible();
                                },
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          InkWell(
                              onTap:()async{
                                if(emailController.text.isEmpty || passController.text.isEmpty || firstName.text.isEmpty || lastName.text.isEmpty )
                                  {
                                    Get.snackbar("Validation", "please fill the required fields properly",colorText: Colors.white,backgroundColor: Colors.blue.shade700.withOpacity(0.5));
                                  }
                                else if(emailController.text.contains("@" )&&emailController.text.endsWith(".com"))
                                {
                                  if(!_isLoading) {
                                    _isLoading=true;
                                    setState(() {

                                    });
                                    bool check = await FirebaseAuthentication()
                                        .SignUp(
                                      emailController.text,
                                      passController.text,
                                      firstName.text,
                                      lastName.text,
                                    );
                                    _isLoading=false;
                                    setState(() {

                                    });
                                    if (check)
                                      Get.offAll(() => EnterPin());
                                  }

                                }
                                else{
                                 Get.snackbar("Validation", "email badly formatted",colorText: Colors.white,backgroundColor: Colors.blue.shade700.withOpacity(0.5));


                                }
                              },

                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/1.5,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff347AF0)),
                                  color: Color(0xff347AF0),
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              margin: EdgeInsets.symmetric(vertical: 15,horizontal: 60),
                              //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),

                              child:_isLoading ? Center(child: CircularProgressIndicator(color: Colors.blue,),) : Center(
                                child: const Text("Signup",
                                    style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold)

                                ),
                              ),
                            ),
                          ),
                          Row(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account?  ",
                                style: TextStyle(
                                  fontSize: 16,

                                ),
                              ),
                              InkWell(
                                onTap: (){
                                   Navigator.push(context,
                                       MaterialPageRoute(
                                           builder: (context)=>Login(),
                                       )
                                   );
                                },

                                child: Text("Signin",
                                  style: TextStyle(
                                    color: Color(0xff347AF0),
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          )
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //
                          //     // Text('Already have an account?',style: TextStyle(fontSize: 16,),),
                          //     // FlatButton(
                          //     //   onPressed: () {},
                          //     //   child: RichText(
                          //     //     text: TextSpan(
                          //     //       children: [
                          //     //         TextSpan(
                          //     //             text: 'Login',
                          //     //             style: TextStyle(
                          //     //               color: Colors.blue,
                          //     //               fontSize: 16,
                          //     //             ),
                          //     //             recognizer: TapGestureRecognizer()
                          //     //               ..onTap = () {
                          //     //                 // Navigator.push(
                          //     //                 //   context,
                          //     //                 //   MaterialPageRoute(
                          //     //                 //       builder: (context) => Login()),
                          //     //                 // );
                          //     //               }),
                          //     //       ],
                          //     //     ),
                          //     //   ),
                          //     // ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),

                    // SizedBox(
                    //   height: 80,
                    // ),
                  ],
                ),
              ),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
