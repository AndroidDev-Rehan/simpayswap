import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

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
              'Change Password',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.only(top: 80),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: passwordFields('Current Password'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: passwordFields('New Password'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: passwordFields('Repeat Password'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 200),
                    child: ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ))),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

TextField passwordFields(final String label) {
  return TextField(
    enableSuggestions: false,
    autocorrect: false,
    obscureText: true,
    style: TextStyle(
        fontWeight: FontWeight.w400, color: Colors.black, fontSize: 18),
    decoration: InputDecoration(
      suffixIcon: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: IconButton(
          icon: Icon(Icons.visibility),
          onPressed: () {},
        ),
      ),
      labelText: label,
      labelStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 18,
          fontWeight: FontWeight.bold),
      contentPadding: EdgeInsets.all(5),
    ),
  );
}
