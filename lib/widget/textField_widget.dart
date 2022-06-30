// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import '../untils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  IconData prefixIcon;
  String hintText;

  TextFieldWidget({
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: appColor().cardColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          prefixIcon,
          size: 20,
          color: appColor().cardColor,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: appColor().cardBtnColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 230, 227, 227),
          ),
        ),
        focusedBorder: OutlineInputBorder(
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
