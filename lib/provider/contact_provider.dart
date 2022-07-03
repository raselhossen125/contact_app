// ignore_for_file: unused_field, unnecessary_null_comparison, unused_element, unnecessary_brace_in_string_interps, await_only_futures, avoid_print

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> items = [];

  getAllContact() {
    items = contactList;
    notifyListeners();
  }

  addContact(ContactModel contactModel) {
    items.add(contactModel);
    notifyListeners();
  }

  updateContact(ContactModel contact, int index) {
    items[index] = contact;
    notifyListeners();
  }

  callSend(String phoneNumber) async {
    final url = await Uri.parse('tel:${phoneNumber}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
    notifyListeners();
  }

  messageSend(String phoneNumber) async {
    final url = await Uri.parse('sms:${phoneNumber}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
    notifyListeners();
  }

  emailSend(String email) async {
    final url = await Uri.parse('mailto:${email}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
    notifyListeners();
  }

  showMap(String address) async {
    final url = await Uri.parse('geo:0,0?q=${address}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
    notifyListeners();
  }

  showWebsite(String websiteUrl) async {
    final url = await Uri.parse('https://${websiteUrl}');
    if (url != null) {
      launchUrl(url);
    } else {
      throw 'Something is else';
    }
    notifyListeners();
  }
}
