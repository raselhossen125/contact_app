// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../untils/colors.dart';

class EditTextFieldWidget extends StatelessWidget {
  IconData icon;
  TextEditingController controller;

  EditTextFieldWidget({
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: appColor().cardColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          icon,
          size: 20,
          color: appColor().cardColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 230, 227, 227),
          ),
        ),
      ),
      style: TextStyle(
        color: appColor().btnColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
