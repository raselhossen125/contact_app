// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison, await_only_futures

import 'dart:io';

import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../untils/back_btn.dart';

class ContactDetailsPage extends StatefulWidget {
  static const routeName = '/contact-details';

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  late ContactModel contact;
  Size? size;

  @override
  void didChangeDependencies() {
    contact = ModalRoute.of(context)!.settings.arguments as ContactModel;
    super.didChangeDependencies();
  }

  buildContainer() {
    return Container(
      height: 1,
      width: size!.width,
      color: Color.fromARGB(255, 221, 220, 220),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 5,),
            BackBtn(
              cardColor: Colors.white,
              cardBtnColor: Colors.black,
              cardBtnIcon: Icon(Icons.arrow_back),
              cardBtnFunction: () {
                Navigator.of(context).pop();
              },
              titleColor: Colors.black,
              title: contact.name,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 10, right: 10, bottom: 10),
                child: ListView(
                  children: [
                    contact.image == null
                        ? Image.asset(
                            'images/R.png',
                            height: 250,
                            width: size!.width,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(contact.image!),
                            height: 250,
                            width: size!.width,
                            fit: BoxFit.cover,
                          ),
                    ListTile(
                      title: Text(contact.mobile),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: _callSend,
                            icon: Icon(Icons.phone_outlined),
                          ),
                          Container(
                            height: 23,
                            width: 1,
                            color: Color.fromARGB(255, 194, 193, 193),
                          ),
                          IconButton(
                            onPressed: _messageSend,
                            icon: Icon(Icons.message_outlined),
                          ),
                        ],
                      ),
                    ),
                    buildContainer(),
                    ListTile(
                      title: Text(
                        contact.email == null || contact.email!.isEmpty
                            ? 'Not Collected'
                            : contact.email!,
                      ),
                      trailing: contact.email == null || contact.email!.isEmpty
                          ? IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit_outlined),
                            )
                          : IconButton(
                              onPressed: _emailSend,
                              icon: Icon(Icons.email_outlined),
                            ),
                    ),
                    buildContainer(),
                    ListTile(
                      title: Text(
                        contact.streetAddress == null || contact.email!.isEmpty
                            ? 'Not Collected'
                            : contact.streetAddress!,
                      ),
                      trailing: IconButton(
                        onPressed: contact.streetAddress == null ||
                                contact.email!.isEmpty
                            ? null
                            : _showMap,
                        icon: Icon(Icons.location_on_outlined),
                      ),
                    ),
                    buildContainer(),
                    ListTile(
                      title: Text(
                        contact.website == null || contact.email!.isEmpty
                            ? 'Not Collected'
                            : contact.website!,
                      ),
                      trailing: IconButton(
                          onPressed:
                              contact.website == null || contact.email!.isEmpty
                                  ? null
                                  : _showWebsite,
                          icon: Icon(Icons.web_outlined)),
                    ),
                    buildContainer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _callSend() async {
    final url = await Uri.parse('tel:${contact.mobile}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
  }

  void _messageSend() async {
    final url = await Uri.parse('sms:${contact.mobile}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
  }

  void _emailSend() async {
    final url = await Uri.parse('mailto:${contact.email}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
  }

  void _showMap() async {
    final url = await Uri.parse('geo:0,0?q=${contact.streetAddress}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
  }

  void _showWebsite() async {
    final url = await Uri.parse('https://${contact.website}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
  }
}
