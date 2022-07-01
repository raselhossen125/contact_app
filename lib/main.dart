// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'pages/contact_details_page.dart';
import 'pages/contact_list_page.dart';
import 'pages/newcontact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: ContactListPage.routeName,
      routes: {
        ContactListPage.routeName: (context) => ContactListPage(),
        NewContactPage.routeName: (context) => NewContactPage(),
        // ContactDetailsPage.routeName: (context) => ContactDetailsPage(),
      },
    );
  }
}
