// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class updatePassword extends StatefulWidget {
  const updatePassword({super.key});

  @override
  State<updatePassword> createState() => _updatePasswordState();
}

class _updatePasswordState extends State<updatePassword> {
  final newPassword = TextEditingController();
  final currentPassword = TextEditingController();

  // final currentUsers = FirebaseAuth.instance.currentUser!;
  changePasssword() async {
    try {
      final credential = EmailAuthProvider.credential(
          email: FirebaseAuth.instance.currentUser!.email!,
          password: currentPassword.text);
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword.text);
      Navigator.of(context).pushNamed('/');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: currentPassword,
            decoration: InputDecoration(label: Text('current password')),
          ),
          TextFormField(
            controller: newPassword,
            decoration: InputDecoration(
              label: Text('new password'),
            ),
          ),
          ElevatedButton(
              onPressed: (() {
                changePasssword();
              }),
              child: Text('update password'))
        ],
      ),
    );
  }
}
