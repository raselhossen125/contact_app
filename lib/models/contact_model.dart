class ContactModel {
  int? id;
  String name;
  String mobile;
  String? email;
  String? streetAddress;
  String? dob;
  String? image;
  String? gender;
  String? website;

  ContactModel({
    this.id,
    required this.name,
    required this.mobile,
    this.email,
    this.streetAddress,
    this.dob,
    this.image,
    this.gender,
    this.website,
  });
}

final contactList = <ContactModel>[
  ContactModel(
    name: 'Leo Mesi',
    mobile: '01755936313',
    id: 01,
    dob: '24/04/1982',
    email: 'leo@gmail.com',
    gender: 'Male',
    streetAddress: 'Argentina',
    website: 'www.flutter.dev',
  ),
  ContactModel(
    name: 'Cristiano Ronaldo',
    mobile: '01755936313',
    id: 02,
    dob: '15/03/1985',
    email: 'ronaldo@gmail.com',
    gender: 'Male',
    streetAddress: 'Portugal',
    website: 'www.dart.dev',
  ),
];
