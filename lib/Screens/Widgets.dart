import 'package:flutter/material.dart';


final emailController = TextEditingController();
final passwordController = TextEditingController();
final firstName = TextEditingController();
final lastName = TextEditingController();

Widget newTextField(String label,String hint, var controller1,var icon1,){
  return  SizedBox(
    child: TextField(controller: controller1,
      // obscureText: !_showPassword._showPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,prefixIcon:icon1,
      ),
    ),
  );
}


