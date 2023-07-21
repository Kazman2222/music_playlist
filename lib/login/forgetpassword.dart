import 'package:audio_playlist/routes/routes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../popUps/utils.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({super.key});

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  TextEditingController forgetPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    forgetPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please enter your email',
                  style: TextStyle(color: Color.fromARGB(255, 71, 224, 76))),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: TextFormField(
                  validator: ((value) =>
                      value != null && !EmailValidator.validate(value)
                          ? 'Enter a valid email'
                          : null),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                  controller: forgetPasswordController,
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.grey,
                      backgroundColor: Color.fromARGB(255, 71, 224, 76)),
                  onPressed: (() {
                    resetPassword();
                  }),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
     final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgetPasswordController.text.trim());
      Utils.showSnackBar('Password reset email sent');
      Navigator.of(context).pushNamed(routeManager.loginUp);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
