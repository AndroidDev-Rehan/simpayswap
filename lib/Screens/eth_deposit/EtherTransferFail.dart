import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:simpayswap/Screens/Drawer/AppDrawer.dart';
import 'package:simpayswap/Screens/eth_deposit/send_ether.dart';
import 'constant.dart';
import 'package:get/get.dart';


class EtherTransferFailScreen extends StatelessWidget {
  const EtherTransferFailScreen(this.errorMessage);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(colors: [Color.fromRGBO(26,26,26,1),Color.fromRGBO(226,16,78,1),]),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                height20Space,
                height20Space,
                height20Space,
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                  child: Text(
                    'Oops.. Something Went Wrong!',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 140.0,
              height: 140.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.0),
                color: redColor.withOpacity(0.3),
              ),
              child: Container(
                width: 110.0,
                height: 110.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55.0),
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.clear_sharp,
                  size: 50.0,
                  color: Colors.red,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width - fixPadding * 4.0,
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
                height20Space,
                Padding(
                  padding: const EdgeInsets.all(fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {

                      Get.off(AppDrawer("Ether Deposit",const SendEtherByWallet(),Colors.white));
                    },
                    borderRadius: BorderRadius.circular(7.0),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(fixPadding * 1.7),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.red,
                      ),
                      child: Text(
                        'Okay!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
