// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  Color cardColor;
  Color cardBtnColor;
  Icon cardBtnIcon;
  Function cardBtnFunction;
  Color titleColor;
  String title;
  IconData? actionIcon;
  Color? actionIconColor;
  Function? actionIconFunction;

  BackBtn({
    required this.cardColor,
    required this.cardBtnColor,
    required this.cardBtnIcon,
    required this.cardBtnFunction,
    required this.titleColor,
    required this.title,
    this.actionIcon,
    this.actionIconColor,
    this.actionIconFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        children: [
          Card(
            elevation: 5,
            color: cardColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: IconButton(
              onPressed: () {
                cardBtnFunction();
              },
              icon: cardBtnIcon,
              color: cardBtnColor,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            title.toString(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: titleColor),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              actionIconFunction!();
            },
            icon: Icon(actionIcon),
            color: actionIconColor,
          ),
        ],
      ),
    );
  }
}
