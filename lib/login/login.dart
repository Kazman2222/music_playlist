import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:biometric_fingerprint/biometric_fingerprint.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../home/final_home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColour,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text(
                      'Sign Up,',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const Text(
                      'Start Listening',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Login',
                      style: TextStyle(
                          color: Color.fromARGB(255, 92, 235, 97),
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 35, bottom: 5),
                child: Text('Email Address*',
                    style: TextStyle(
                        color: Color.fromARGB(255, 99, 241, 104),
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  child: TextField(
                    onSubmitted: (value) {},
                    textAlign: TextAlign.start,
                    decoration: kTextFieldDecoration.copyWith(
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        size: 25,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.grey,
                      hintText: 'Enter Email Address',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 35, bottom: 5),
                child: Text(
                  'Password*',
                  style: TextStyle(
                    color: Color.fromARGB(255, 99, 241, 104),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  child: TextField(
                    onSubmitted: (value) {},
                    textAlign: TextAlign.start,
                    decoration: kTextFieldDecoration.copyWith(
                      prefixIcon: const Icon(
                        Icons.key_outlined,
                        size: 25,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.grey,
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          primary: const Color.fromARGB(255, 57, 213, 63)),
                      onPressed: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const final_home()),
                        );
                      }),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      )),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Center(
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 57, 213, 63),
                      decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: IconButton(
                  iconSize: 110,
                  color: const Color.fromARGB(255, 57, 213, 63),
                  icon: const Icon(Icons.fingerprint),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account?",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    children: [
                      WidgetSpan(
                        child: SizedBox(
                          width: 5.w,
                        ),
                      ),
                      const TextSpan(
                        text: 'SIGN UP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 57, 213, 63),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
