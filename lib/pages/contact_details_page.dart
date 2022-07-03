// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison, await_only_futures, must_be_immutable, unused_local_variable, avoid_print

import 'dart:io';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/back_btn.dart';
import '../widget/editTextField_widget.dart';
import 'contact_list_page.dart';

class ContactDetailsPage extends StatefulWidget {
  static const routeName = '/contact-details';
  ContactModel contact;
  int index;

  ContactDetailsPage({
    required this.contact,
    required this.index,
  });

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  Size? size;
  bool webListTile = true;
  bool phoneListTile = true;
  bool emailListTile = true;
  bool addressListTile = true;
  bool saveBtn = false;

  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final websiteController = TextEditingController();

  buildContainer() {
    return Container(
      height: 1,
      width: size!.width,
      color: Color.fromARGB(255, 221, 220, 220),
    );
  }

  buildContainer2() {
    return Container(
      height: 23,
      width: 1,
      color: Color.fromARGB(255, 194, 193, 193),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            BackBtn(
              cardColor: Colors.white,
              cardBtnColor: Colors.black,
              cardBtnIcon: Icon(Icons.arrow_back),
              cardBtnFunction: () {
                Navigator.of(context).pop();
              },
              titleColor: Colors.black,
              title: widget.contact.name,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 2, left: 10, right: 10, bottom: 10),
                child: Consumer<ContactProvider>(
                  builder: (context, provider, _) => ListView(
                    children: [
                      widget.contact.image == null
                          ? Image.asset(
                              'images/R.png',
                              height: 250,
                              width: size!.width,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(widget.contact.image!),
                              height: 250,
                              width: size!.width,
                              fit: BoxFit.cover,
                            ),
                      SizedBox(
                        height: 5,
                      ),
                      buildContainer(),
                      phoneListTile
                          ? ListTile(
                              contentPadding:
                                  EdgeInsets.only(right: 0, left: 12),
                              title: Text(widget.contact.mobile),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      provider.callSend(widget.contact.mobile);
                                    },
                                    icon: Icon(Icons.phone_outlined),
                                  ),
                                  buildContainer2(),
                                  IconButton(
                                    onPressed: () {
                                      provider
                                          .messageSend(widget.contact.mobile);
                                    },
                                    icon: Icon(Icons.message_outlined),
                                  ),
                                  buildContainer2(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        phoneListTile = false;
                                        saveBtn = true;
                                      });
                                    },
                                    icon: Icon(Icons.edit_outlined),
                                  ),
                                ],
                              ),
                            )
                          : EditTextFieldWidget(
                              controller: phoneController,
                              icon: Icons.phone_outlined,
                            ),
                      buildContainer(),
                      emailListTile
                          ? ListTile(
                              contentPadding:
                                  EdgeInsets.only(right: 0, left: 12),
                              title: Text(
                                widget.contact.email == null ||
                                        widget.contact.email!.isEmpty
                                    ? 'Not Collected'
                                    : widget.contact.email!,
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      widget.contact.email == null ||
                                              widget.contact.email!.isEmpty
                                          ? null
                                          : provider
                                              .emailSend(widget.contact.email!);
                                    },
                                    icon: Icon(Icons.email_outlined),
                                  ),
                                  buildContainer2(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        emailListTile = false;
                                        saveBtn = true;
                                      });
                                    },
                                    icon: Icon(Icons.edit_outlined),
                                  ),
                                ],
                              ),
                            )
                          : EditTextFieldWidget(
                              controller: emailController,
                              icon: Icons.email_outlined,
                            ),
                      buildContainer(),
                      addressListTile
                          ? ListTile(
                              contentPadding:
                                  EdgeInsets.only(right: 0, left: 12),
                              title: Text(
                                widget.contact.streetAddress == null ||
                                        widget.contact.streetAddress!.isEmpty
                                    ? 'Not Collected'
                                    : widget.contact.streetAddress!,
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      widget.contact.streetAddress == null ||
                                              widget.contact.streetAddress!
                                                  .isEmpty
                                          ? null
                                          : provider.showMap(
                                              widget.contact.streetAddress!);
                                    },
                                    icon: Icon(Icons.location_on_outlined),
                                  ),
                                  buildContainer2(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        addressListTile = false;
                                        saveBtn = true;
                                      });
                                    },
                                    icon: Icon(Icons.edit_outlined),
                                  ),
                                ],
                              ),
                            )
                          : EditTextFieldWidget(
                              controller: addressController,
                              icon: Icons.location_on_outlined,
                            ),
                      buildContainer(),
                      webListTile
                          ? ListTile(
                              contentPadding:
                                  EdgeInsets.only(right: 0, left: 12),
                              title: Text(
                                widget.contact.website == null ||
                                        widget.contact.website!.isEmpty
                                    ? 'Not Collected'
                                    : widget.contact.website!,
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      widget.contact.website == null ||
                                              widget.contact.website!.isEmpty
                                          ? null
                                          : provider.showWebsite(
                                              widget.contact.website!);
                                    },
                                    icon: Icon(Icons.web_outlined),
                                  ),
                                  buildContainer2(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        webListTile = false;
                                        saveBtn = true;
                                      });
                                    },
                                    icon: Icon(Icons.edit_outlined),
                                  ),
                                ],
                              ),
                            )
                          : EditTextFieldWidget(
                              controller: websiteController,
                              icon: Icons.web_outlined,
                            ),
                      buildContainer(),
                      if (saveBtn)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              updateData();
                              webListTile = true;
                              emailListTile = true;
                              addressListTile = true;
                              phoneListTile = true;
                              saveBtn = false;
                            });
                          },
                          child: Text('Save'),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateData() {
    final newData = ContactModel(
      name: widget.contact.name,
      mobile: phoneController.text.isEmpty
          ? widget.contact.mobile
          : phoneController.text,
      email: emailController.text.isEmpty
          ? widget.contact.email
          : emailController.text,
      streetAddress: addressController.text.isEmpty
          ? widget.contact.streetAddress
          : addressController.text,
      website: websiteController.text.isEmpty
          ? widget.contact.website
          : websiteController.text,
      dob: widget.contact.dob,
      gender: widget.contact.gender,
      id: widget.contact.id,
      image: widget.contact.image,
    );
    Provider.of<ContactProvider>(context, listen: false).updateContact(newData, widget.index);
    Navigator.of(context).pushNamed(ContactListPage.routeName);
  }
}
