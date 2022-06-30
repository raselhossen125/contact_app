// ignore_for_file: prefer_const_constructors

import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/pages/contact_details_page.dart';
import 'package:flutter/material.dart';

import 'newcontact_page.dart';

class ContactListPage extends StatefulWidget {
  static const routeName = '/';
  const ContactListPage({Key? key}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Contact List'),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.pushNamed(context, NewContactPage.routeName).then((value) {
              setState(() {});
            });
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            ListTile(
              title: Text('Contact List', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: ListView.builder(
                  itemCount: contactList.length,
                  itemBuilder: (context, index) {
                    final contact = contactList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(ContactDetailsPage.routeName, arguments: contact);
                        },
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              child: Center(
                                child: Text(
                                  contact.name.substring(0, 2),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            title: Text(contact.name),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
