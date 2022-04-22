
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:simpayswap/Screens/Drawer/AppDrawer.dart';
import 'package:simpayswap/Screens/eth_deposit/send_ether.dart';
import 'package:simpayswap/pages/deposit_page.dart';
import 'package:simpayswap/pages/portfolio_page.dart';
import 'package:simpayswap/pages/transaction_page.dart';

import 'package:flutter/material.dart';

import '../Screens/eth_deposit/eth_deposit.dart';

// ignore: must_be_immutable
class RootScreen extends StatefulWidget {
  RootScreen({Key? key}) : super(key: key);
  bool? profile_verified;

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedPage = 1;
  // final auth_controller = Get.find<AuthController>();
  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  List<String> titleName = ['All Transactions', 'Simpyswap', 'Portfolio'];

  List<Widget> myPages = [
    AppDrawer('All Transactions', TransactionPage(),Colors.white),
    AppDrawer('Wellcome to SimpaySwap', DepositPage(),Colors.white),
    AppDrawer("Portfolio", PortfolioPage(),Colors.blue.shade700)
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          children: myPages,
          index: _selectedPage,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AppDrawer("Ether Deposit", SendEtherByWallet(), Colors.white));
            // _onItemTapped(1);
            // print("item tapped");
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.grey.shade100,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.close_fullscreen_rounded),
                  label: 'Transactions'),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_arrow),
                label: 'Deposit',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.folder_shared_outlined), label: 'Portfolio'),
            ],
            currentIndex: _selectedPage,
            onTap: _onItemTapped,
          ),
        ),
      );
  }
}
