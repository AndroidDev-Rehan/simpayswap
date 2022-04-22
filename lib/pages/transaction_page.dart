import 'package:simpayswap/controller/transcation_controller.dart';
import 'package:simpayswap/widgets/custom_drawer_widget.dart';
import 'package:simpayswap/widgets/filter_list_widget.dart';
import 'package:simpayswap/widgets/transaction_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({Key? key}) : super(key: key);
  final transactionController = Get.put(TransactionController());

  void filterList(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        isScrollControlled: true,
        context: ctx,
        builder: (_) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter state) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                child: Container(
                  height: MediaQuery.of(ctx).size.height * 0.50,
                  child: FilterListWidget(stateSetter: state,),
                ),
              );
            }
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TransactionList(),
    );
  }
}
