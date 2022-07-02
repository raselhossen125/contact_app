// ignore_for_file: prefer_const_constructors, await_only_futures, use_function_type_syntax_for_parameters

import 'package:animations/animations.dart';
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
        floatingActionButton: OpenContainer(
          closedShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          transitionDuration: Duration(seconds: 2),
          closedBuilder: (context, openWidget()) {
            return FloatingActionButton(
              onPressed: () async {
                await openWidget();
                setState(() {});
              },
              child: Icon(Icons.add),
            );
          },
          openBuilder: (context, closeWidget) {
            return NewContactPage();
          },
        ),
        body: PageTransitionSwitcher(
          transitionBuilder: ((
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          }),
          child: Column(
            children: [
              Card(
                elevation: 3,
                child: ListTile(
                  title: Text(
                    '${contactList.length}  Contacts',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 5),
                  child: ListView.builder(
                    itemCount: contactList.length,
                    itemBuilder: (context, index) {
                      final contact = contactList[index];
                      return OpenContainer(
                        transitionDuration: Duration(seconds: 2),
                        transitionType: ContainerTransitionType.fadeThrough,
                        closedBuilder:
                            (BuildContext _, VoidCallback openContainer) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: InkWell(
                              onTap: openContainer,
                              // () {
                              //   Navigator.of(context).pushNamed(
                              //     ContactDetailsPage.routeName,
                              //     arguments: contact,
                              //   );
                              // },
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
                        openBuilder:
                            (BuildContext _, VoidCallback openContainer) {
                          return ContactDetailsPage(
                              contact: contact, index: index);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
