import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpayswap/Authentication/FirebaseAuthentication.dart';
import 'package:simpayswap/Authentication/biometric_auth.dart';
import 'package:simpayswap/Screens/EnterPin.dart';
import 'package:simpayswap/Screens/EnterPinLogin.dart';
import 'package:simpayswap/Screens/ForgotPassword.dart';
import 'package:simpayswap/Screens/UserHome.dart';
import 'SignUp.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final emailController=TextEditingController();
  final passController=TextEditingController();
  bool _isLoading=false;
  String email="";
  String pass="";

  bool isPasswordVisible=true;

 void PasswordVisible()
  {
    if(isPasswordVisible==true)
    {
      isPasswordVisible=false;
    }
    else if(isPasswordVisible==false)
    {
      isPasswordVisible=true;
    }
    setState(() {

    });
  }
  Widget build(BuildContext context)
  {

    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor:Colors.white,
        elevation: 0,
      ),

      body:Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top:30,
            left: 0,
            right: 0,
            child: Container
              (
                alignment: Alignment.topCenter,
               // padding: EdgeInsets.only(top: 30),
                child:
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20,bottom: 50),

                      child: Text("Welcome Back!",style: TextStyle(fontSize: 25,color: Colors.black,),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height/4.5,
                        child: Image.asset("assets/login_pic.png")),
                  ],
                )

            ),
          ),
          //
          Positioned(
            bottom: 0,
            right: 0,left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),

              decoration: BoxDecoration(border: Border.all(
                  style: BorderStyle.solid, width: 0, color: Colors.white)
                ,
                color: CupertinoColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)
                ),
              ),


              child: Column(
                children: <Widget>[
                // Text("\n"),
                  Container(
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,),

                    child: Column(
                      children: <Widget>[

                        TextField(controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(labelText: "Email address",
                            prefixIcon: Icon(Icons.mail),
                            hintText: "name@email.com",
                          ),

                        ),

                        TextField(controller: passController,obscureText: isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: "  Password",// border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(icon: isPasswordVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                              onPressed: () {
                                PasswordVisible();
                              },
                            ),

                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ],


                    ),
                  ),
                  //Text("\n"),


                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                    },
                    child: Container(

                      alignment: Alignment.topRight,
                        margin: EdgeInsets.only(top: 10),
                        child:
                    Text("Forget Password?",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff347AF0)
                      ),
                    )
                    ),
                  ),
                  InkWell(
                   onTap:()async{
                     if(!_isLoading)
                       {
                         try {
                           _isLoading = true;
                           setState(() {});
                           bool check = await FirebaseAuthentication().login(
                               emailController.text, passController.text);
                           _isLoading = false;
                           if (check) {
                             Get.offAll(EnterPinLogin());
                           }

                           setState(() {

                           });
                         }catch(e){
                           _isLoading = false;
                           setState(() {

                           });
                         }
                       }
                   },

                    child: Container(
                      height: 50,
                     width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xff347AF0)),
                          color: Color(0xff347AF0),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      margin: EdgeInsets.only(top: 30,bottom: 20),
                     // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),

                        child:_isLoading ? Center(child: CircularProgressIndicator(color: Colors.white,),) : Center(
                          child: const Text("Login",
                              style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account  ",
                        style: TextStyle(
                            fontSize: 16,

                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                              builder: (context)=>SignUp()
                          )
                          );
                          },

                        child: Text("Signup",
                          style: TextStyle(
                            color: Color(0xff347AF0),
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),

                 ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}


