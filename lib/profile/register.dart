import 'package:audio_playlist/profile/profile.dart';
import 'package:audio_playlist/profile/profile_information.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackGroundColour,
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('registraton')
              .where('id', isEqualTo: FirebaseAuth.instance.currentUser?.email)
              .snapshots(),
          builder: ((context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return profile_information();
            } else if (streamSnapshot.connectionState ==
                ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else {
              return ProfileDetails();
            }
          }),
        ));
  }
}
