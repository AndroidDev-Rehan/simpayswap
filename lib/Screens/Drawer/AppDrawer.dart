import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:simpayswap/Screens/Drawer/Drawer.dart';
import 'package:simpayswap/Screens/UserHome.dart';
import 'package:simpayswap/views/root_screen.dart';

class AppDrawer extends StatelessWidget {
  final _advancedDrawerController = AdvancedDrawerController();
  String _title;
  Widget child;
  Color color;
  AppDrawer(this._title,this.child,this.color);
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdropColor: Colors.white,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
    animateChildDecoration: true,
    rtlOpening: true,
    disabledGestures: false,
    childDecoration: const BoxDecoration(
    // NOTICE: Uncomment if you want to add shadow behind the page.
    // Keep in mind that it may cause animation jerks.
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        spreadRadius: 2
      ),
    ],
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    ),
        child:Scaffold(
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(
              color:color==Colors.blue.shade700 ? Colors.white :Colors.black,
            ),
            backgroundColor: color,
            title: Text(_title,style: TextStyle(color: color==Colors.blue.shade700 ? Colors.white : Colors.black),),
            centerTitle: true,

            actions: [
              IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? Icons.clear : Icons.format_align_right_outlined,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: child,
         // endDrawer: Drawer(),
        ),
      //  openRatio: 10,
        drawer: Drawers()

    );
  }
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
