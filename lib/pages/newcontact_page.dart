// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NewContactPage extends StatefulWidget {
  static const routeName = '/new=contact';
  const NewContactPage({Key? key}) : super(key: key);

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final nameController = TextEditingController();
  String? dob;
  String? imagePath;
  ImageSource source = ImageSource.camera;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.person),
              labelText: 'Full Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _showDatePickerDialog,
                child: Text('Select Date of Birth'),
              ),
              Chip(
                label: Text(dob == null ? "No date chosen!" : dob!),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                elevation: 10,
                child: imagePath == null
                    ? Image.asset(
                        'images/R.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(imagePath!),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      source = ImageSource.camera;
                      _getImage();
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text('Capture'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      source = ImageSource.gallery;
                      _getImage();
                    },
                    icon: const Icon(Icons.photo),
                    label: const Text('Gallery'),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void _showDatePickerDialog() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1922),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      setState(() {
        dob = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  void _getImage() async{
    final pickFile = await ImagePicker().pickImage(source: source);
    if (pickFile!=null) {
      setState(() {
        imagePath = pickFile.path;
      });
    }
  }
}
