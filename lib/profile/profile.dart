// import 'dart:html';

import 'package:audio_playlist/profile/profile_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final stageNameController = TextEditingController();
  final genderController = TextEditingController();
  final dateofbirthController = TextEditingController();
  final aboutselfController = TextEditingController();
  final nationalityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColour,
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'First Name*',
                      style: TextStyle(
                        color: Color.fromARGB(255, 99, 241, 104),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextField(
                      controller: firstNameController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Last Name*',
                      style: TextStyle(
                        color: Color.fromARGB(255, 99, 241, 104),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextField(
                      controller: lastNameController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Stage Name*',
                      style: TextStyle(
                        color: Color.fromARGB(255, 99, 241, 104),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextField(
                      controller: stageNameController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Date of birth*',
                      style: TextStyle(
                        color: Color.fromARGB(255, 99, 241, 104),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextField(
                      controller: dateofbirthController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          labelText: 'dd/mm/yyyy',
                          labelStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.grey,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Nationality*',
                      style: TextStyle(
                        color: Color.fromARGB(255, 99, 241, 104),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextField(
                      controller: nationalityController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Gender*',
                      style: TextStyle(
                        color: Color.fromARGB(255, 99, 241, 104),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextField(
                      controller: genderController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Tell us about yourself*',
                          style: TextStyle(
                            color: Color.fromARGB(255, 99, 241, 104),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'max 150 words',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5 * 24,
                    child: TextField(
                      controller: aboutselfController,
                      maxLength: 150,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        final user = Userrr(
                          id: 'kazeemquayum67@gmail.com',
                          firstname: firstNameController.text,
                          lastname: lastNameController.text,
                          nationality: nationalityController.text,
                          gender: genderController.text,
                          stagename: stageNameController.text,
                          tellUsAboutYourself: aboutselfController.text,
                          dateOfBirth: dateofbirthController.text,
                        );
                        createUser(user);
                        print(firstNameController.text);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 30.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future createUser(Userrr user) async {
    final docUser = FirebaseFirestore.instance.collection('registraton').doc();
    //user.id = docUser.id;

    final json = user.toJson();

    await docUser.set(json);
  }
}
