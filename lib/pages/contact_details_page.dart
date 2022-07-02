// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison, await_only_futures, must_be_immutable, unused_local_variable, avoid_print

import 'dart:io';
import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
  // late ContactModel contact;
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

  // @override
  // void didChangeDependencies() {
  //   contact = ModalRoute.of(context)!.settings.arguments as ContactModel;
  //   super.didChangeDependencies();
  // }

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
                child: ListView(
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
                          SizedBox(height: 5,),
                          buildContainer(),
                    phoneListTile
                        ? ListTile(
                            contentPadding: EdgeInsets.only(right: 0, left: 12),
                            title: Text(widget.contact.mobile),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: _callSend,
                                  icon: Icon(Icons.phone_outlined),
                                ),
                                buildContainer2(),
                                IconButton(
                                  onPressed: _messageSend,
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
                        : Column(
                            children: [
                              EditTextFieldWidget(
                                controller: phoneController,
                                icon: Icons.phone_outlined,
                              ),
                            ],
                          ),
                    buildContainer(),
                    emailListTile
                        ? ListTile(
                            contentPadding: EdgeInsets.only(right: 0, left: 12),
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
                                  onPressed: widget.contact.email == null ||
                                          widget.contact.email!.isEmpty
                                      ? null
                                      : _emailSend,
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
                        : Column(
                            children: [
                              EditTextFieldWidget(
                                controller: emailController,
                                icon: Icons.email_outlined,
                              ),
                            ],
                          ),
                    buildContainer(),
                    addressListTile
                        ? ListTile(
                            contentPadding: EdgeInsets.only(right: 0, left: 12),
                            title: Text(
                              widget.contact.streetAddress == null ||
                                      widget.contact.email!.isEmpty
                                  ? 'Not Collected'
                                  : widget.contact.streetAddress!,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: widget.contact.streetAddress ==
                                              null ||
                                          widget.contact.streetAddress!.isEmpty
                                      ? null
                                      : _showMap,
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
                        : Column(
                            children: [
                              EditTextFieldWidget(
                                controller: addressController,
                                icon: Icons.location_on_outlined,
                              ),
                            ],
                          ),
                    buildContainer(),
                    webListTile
                        ? ListTile(
                            contentPadding: EdgeInsets.only(right: 0, left: 12),
                            title: Text(
                              widget.contact.website == null ||
                                      widget.contact.email!.isEmpty
                                  ? 'Not Collected'
                                  : widget.contact.website!,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: widget.contact.website == null ||
                                          widget.contact.website!.isEmpty
                                      ? null
                                      : _showWebsite,
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
                        : Column(
                            children: [
                              EditTextFieldWidget(
                                controller: websiteController,
                                icon: Icons.web_outlined,
                              ),
                            ],
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
          ],
        ),
      ),
    );
  }

  void updateData() {
    print(widget.contact.mobile);
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
    contactList[widget.index] = newData;
    print(contactList.map((e) => e.mobile));
    Navigator.of(context).pushNamed(ContactListPage.routeName);
  }

  void _callSend() async {
    final url = await Uri.parse('tel:${widget.contact.mobile}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
  }

  void _messageSend() async {
    final url = await Uri.parse('sms:${widget.contact.mobile}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
  }

  void _emailSend() async {
    final url = await Uri.parse('mailto:${widget.contact.email}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
  }

  void _showMap() async {
    final url = await Uri.parse('geo:0,0?q=${widget.contact.streetAddress}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
  }

  void _showWebsite() async {
    final url = await Uri.parse('https://${widget.contact.website}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
  }
}
