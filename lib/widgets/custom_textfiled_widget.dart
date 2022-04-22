import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatelessWidget {
  const CustomTextfieldWidget({
    Key? key,
    required this.label,
    required this.placeholder,
    this.number,
    this.date,
  }) : super(key: key);

  final String label;
  final String placeholder;
  final bool? number;
  final bool? date;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: number == true
          ? TextInputType.number
          : date == true
              ? TextInputType.datetime
              : TextInputType.name,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey.shade600,
          fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16,
        ),
        contentPadding: EdgeInsets.all(5),
      ),
    );
  }
}
