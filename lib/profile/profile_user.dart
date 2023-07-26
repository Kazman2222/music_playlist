import 'package:cloud_firestore/cloud_firestore.dart';

class Userrr {
  String id;
  final String firstname;
  final String lastname;
  final String nationality;
  final String gender;
  final String stagename;
  final String tellUsAboutYourself;
  final String dateOfBirth;

  Userrr({
    this.id = '',
    required this.firstname,
    required this.lastname,
    required this.nationality,
    required this.gender,
    required this.stagename,
    required this.tellUsAboutYourself,
    required this.dateOfBirth
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'nationality': nationality,
        'gender': gender,
        'stagename': stagename,
        'tellUsAboutYourself':tellUsAboutYourself,
        'dateOfBirth': dateOfBirth
      };

  static Userrr fromJson(Map<String, dynamic> json) => Userrr(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['fastname'],
      nationality: json['nationality'],
      gender: json["gender"],
       stagename: json["stagename"],
        tellUsAboutYourself: json["tellUsAboutYourself"],
      dateOfBirth: json['dateOfBirth']
     );
}
