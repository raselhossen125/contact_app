// ignore_for_file: prefer_const_constructors

import 'package:contact_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/contact_list_page.dart';
import 'pages/newcontact_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactProvider()..getAllContact(),
      child: MaterialApp(
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
      ),
    );
  }
}
