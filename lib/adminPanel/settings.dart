import 'package:audio_playlist/artistesdetails/profile.dart';
import 'package:audio_playlist/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/buttons.dart';

class update_user extends StatefulWidget {
  const update_user({super.key});

  @override
  State<update_user> createState() => _update_userState();
}

class _update_userState extends State<update_user> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final stageNameController = TextEditingController();
  final genderController = TextEditingController();
  final dateofbirthController = TextEditingController();
  final aboutselfController = TextEditingController();
  final nationalityController = TextEditingController();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('registraton');
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      firstNameController.text = '';
      lastNameController.text = '';
      stageNameController.text = '';
      genderController.text = '';
      dateofbirthController.text = '';
      aboutselfController.text = '';
      nationalityController.text = '';
    }
    await showModalBottomSheet(
        backgroundColor: Color(0xff5C8D89),
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        context: context,
        builder: ((context) {
          return FractionallySizedBox(
            heightFactor: 0.7,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text('First Name*',
                        style: TextStyle(
                            color: Color.fromARGB(255, 99, 241, 104),
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ),
                  TextField(
                    controller: firstNameController,
                    textAlign: TextAlign.start,
                    decoration: kTextFieldDecoration.copyWith(
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: documentSnapshot!['firstname'],
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text('Last Name*',
                        style: TextStyle(
                            color: Color.fromARGB(255, 99, 241, 104),
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ),
                  TextField(
                    controller: lastNameController,
                    textAlign: TextAlign.start,
                    decoration: kTextFieldDecoration.copyWith(
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: documentSnapshot['lastname'],
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text('Stage Name*',
                        style: TextStyle(
                            color: Color.fromARGB(255, 99, 241, 104),
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ),
                  TextField(
                    controller: stageNameController,
                    textAlign: TextAlign.start,
                    decoration: kTextFieldDecoration.copyWith(
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: documentSnapshot['stagename'],
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text('About*',
                        style: TextStyle(
                            color: Color.fromARGB(255, 99, 241, 104),
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ),
                  SizedBox(
                    height: 80,
                    child: TextField(
                      controller: aboutselfController,
                      textAlign: TextAlign.start,
                      maxLines: null,
                      expands: true,
                      decoration: kTextFieldDecoration.copyWith(
                          filled: true,
                          fillColor: Colors.grey,
                          hintText: documentSnapshot['tellUsAboutYourself'],
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Center(
                    child: SizedBox(
                      height: 60.h,
                      width: 250.w,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: Colors.green),
                        onPressed: (() async {
                          Navigator.pop(context);
                          final String? firstName =
                              firstNameController.text == ''
                                  ? documentSnapshot['firstname']
                                  : firstNameController.text;
                          final String lastName = lastNameController.text == ''
                              ? documentSnapshot['lastname']
                              : lastNameController.text;
                          final String stageName =
                              stageNameController.text == ''
                                  ? documentSnapshot['stagename']
                                  : stageNameController.text;
                          final String gender = genderController.text == ''
                              ? documentSnapshot['gender']
                              : genderController.text;
                          final String dateofBirth =
                              dateofbirthController.text == ''
                                  ? documentSnapshot['dateOfBirth']
                                  : dateofbirthController.text;
                          final String aboutSelf =
                              aboutselfController.text == ''
                                  ? documentSnapshot['tellUsAboutYourself']
                                  : aboutselfController.text;
                          final String nationality =
                              nationalityController.text == ''
                                  ? documentSnapshot['nationality']
                                  : nationalityController.text;

                          if (firstName != null) {
                            await _users.doc(documentSnapshot.id).update({
                              'firstname': firstName,
                              'lastname': lastName,
                              'stagename': stageName,
                              'gender': gender,
                              'dateOfBirth': dateofBirth,
                              'tellUsAboutYourself': aboutSelf,
                              'nationality': nationality
                            });
                            firstNameController.text = '';
                            lastNameController.text = '';
                            stageNameController.text = '';
                            genderController.text = '';
                            dateofbirthController.text = '';
                            aboutselfController.text = '';
                            nationalityController.text = '';
                          }
                        }),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Update Profile',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    // bool value = true;
    return Consumer<Toggler>(
      builder: (context, toggleButton, child) {
        return Scaffold(
          backgroundColor: kBackGroundColour,
          appBar: buildAppBars(
              text: 'Settings', onTap: () => Navigator.pop(context)),
          body: SafeArea(
            top: true,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('registraton')
                  .where('id',
                      isEqualTo: FirebaseAuth.instance.currentUser?.email)
                  .snapshots(),
              builder: ((context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: ((context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return Column(
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(
                            //       'Update info : ',
                            //       style: GoogleFonts.alegreyaSans(
                            //           textStyle: const TextStyle(
                            //         fontSize: 17.0,
                            //         fontWeight: FontWeight.bold,
                            //         color: Colors.black,
                            //       )),
                            //     ),
                            //     IconButton(
                            //         onPressed: (() => _update(documentSnapshot)),
                            //         icon: Icon(Icons.edit))
                            //   ],
                            // ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.h),
                              child: Column(
                                children: [
                                  InkButton(
                                    icon1: Icons.app_registration,
                                    text1: 'Update Info',
                                    onTap: () {
                                      _update(documentSnapshot);
                                    },
                                  ),
                                  buildPadding(),
                                  InkButton(
                                    icon1: toggleButton.isToggled
                                        ? Icons.dark_mode
                                        : Icons.light_mode,
                                    text1: toggleButton.isToggled
                                        ? 'Dark Mode'
                                        : 'Light Mode',
                                    dswitch: toggleButton.isToggled,
                                    onTap: () {
                                      // Navigator.pushNamed(context, '/addMusic');
                                      // setState(() {
                                      //   value = !value;
                                      // });
                                      // toggleButton.toggle();
                                    },
                                  ),
                                  buildPadding(),
                                  InkButton(
                                    icon1: Icons.password,
                                    text1: 'Change Password',
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/changePassword');
                                    },
                                  ),
                                  buildPadding(),
                                ],
                              ),
                            ),
                          ],
                        );
                      }));
                } else {
                  return profilePage();
                }
              }),
            ),
          ),
        );
      },
    );
  }
}
