import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:simpayswap/Screens/Drawer/AppDrawer.dart';
import 'package:simpayswap/main.dart';
import 'package:simpayswap/pages/deposit_page.dart';

import '../Login.dart';


class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius:3,
                      blurRadius: 7
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage("assets/person.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: Text(
                  '\nJOJ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                child: Text(
                  'Khan',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                child: Text(
                  'Verify your profile',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              newListTile(Icons.account_balance_wallet, 'Wallet', () {
                //Get.to(() => CheckYourEmail());
              }),
              newListTile(Icons.euro_symbol, 'Deposit', () {
                Get.to(() => AppDrawer("Deposit", DepositPage(), Colors.white));
                //Navigator.pop(context);
              }),
              newListTile(CupertinoIcons.star_circle, 'Withdraw', () {

              }),
              newListTile(Icons.send, 'Send', () {

              }),
              newListTile(CupertinoIcons.repeat, 'Exchange', () {

              }),
              newListTile(CupertinoIcons.profile_circled, 'Profile', () {

              }),

              newListTile(Icons.logout, 'Sign out', () async{
                await FirebaseAuth.instance.signOut();
                await pref.clearPref();
                Get.offAll(() => Login());
              }),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget newListTile(var icon, var title, var ontap) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: ontap,
  );
}
