import 'package:simpayswap/widgets/custom_textfiled_widget.dart';
import 'package:flutter/material.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            elevation: 0,
            backgroundColor: Colors.grey.shade200,
            centerTitle: true,
            title: Text(
              'Personal Information',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfieldWidget(
                          label: 'First Name', placeholder: 'Simpy')),
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfieldWidget(
                          label: 'Last Name', placeholder: 'Swap')),
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfieldWidget(
                          label: 'Street Address',
                          placeholder: '74 Monroe Avenue')),
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfieldWidget(
                          label: 'City', placeholder: 'Fort Myers')),
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfieldWidget(
                          label: 'Zip/Area code', placeholder: '33901')),
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfieldWidget(
                          label: 'Citizenship', placeholder: 'United States'))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'We get your personal information from the verification process. If you want to make changes on your personal information, contact our support.',
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
