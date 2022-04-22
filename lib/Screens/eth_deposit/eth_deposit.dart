import 'package:flutter/material.dart';

import '../Widgets.dart';

class EthDepositScreen extends StatefulWidget {
  const EthDepositScreen({Key? key}) : super(key: key);

  @override
  State<EthDepositScreen> createState() => _EthDepositScreenState();
}

class _EthDepositScreenState extends State<EthDepositScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          newTextField(
            'First Name',
            '',
              TextEditingController(),
            Icon(Icons.person),
          ),
          newTextField(
            'Last Name',
            '',
          TextEditingController(),
            Icon(Icons.person),
          ),

          newTextField(
            'Email address',
            'name@email.com',
            TextEditingController(),
            Icon(Icons.email),
          ),
        ],

      ),
    );
  }
}
