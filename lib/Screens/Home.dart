import 'package:simpayswap/Screens/SignUp.dart';

import 'Login.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue.shade700,
        elevation: 0,
        toolbarHeight: 0,
      ),


      backgroundColor: Colors.blue.shade700,

      body:

        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.topCenter,
            child: Column( crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  height: 200,
                    width: 200,
                    child:
                  Image.asset("assets/SimpySwap.png"),

                ),
                Text("Welcome to",style: TextStyle(fontSize: 30,color: Colors.blueGrey.shade200),),

                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 55,
                    child:
                Image.asset("assets/logo.png")
                ),

                SizedBox(
                  height: 200,

                ),

                InkWell(
                  child: Container(

                    margin: EdgeInsets.symmetric(vertical:10,horizontal: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 88),
                    child:
                    Text("Signin",
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 15,
                       // fontWeight: FontWeight.bold,

                      ),
                    ),

                  ),
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                ),

                InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical:10,horizontal: 0),
                    decoration: BoxDecoration(border: Border.all(color: Colors.white),
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 86
                    ),
                    child:
                    const Text("Signup",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                         // fontWeight: FontWeight.bold
                      ),



                    ),

                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                ),


              ],
            ),
          ),
        ),

      );
   }
}
