import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audio_playlist/login/signUp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:biometric_fingerprint/biometric_fingerprint.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio_playlist/routes/routes.dart';
import 'package:page_transition/page_transition.dart';
import '../bottomnavigationbar/bottomnavigationbar.dart';
import '../components/buttons.dart';
import '../constants.dart';
import '../home/final_home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
// import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

import '../main.dart';
import '../popUps/utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool seer = false;
  bool showSpinner = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // SimpleFontelicoProgressDialog _dialog =
    //     SimpleFontelicoProgressDialog(context: context);
    return Scaffold(
      backgroundColor: kBackGroundColour,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                      AnimatedTextKit(
                        isRepeatingAnimation: true,
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(
                            'Sign In,',
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                            speed: const Duration(milliseconds: 200),
                            curve: Curves.linear,
                          )
                        ],
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
                    child: TextFormField(
                      controller: emailController,
                      validator: ((email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null),
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    child: TextFormField(
                      controller: passwordController,
                      validator: ((value) => value != null && value.length < 8
                          ? 'Enter min.8 characters'
                          : null),
                      textAlign: TextAlign.start,
                      obscureText: seer,
                      decoration: kTextFieldDecoration.copyWith(
                        prefixIcon: const Icon(
                          Icons.key_outlined,
                          size: 25,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: 'Enter Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              seer = !seer;
                            });
                          },
                          child: Icon(
                            seer ? Icons.visibility_off : Icons.visibility,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
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
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          primary: const Color.fromARGB(255, 57, 213, 63)),
                      onPressed: (() {
                        signIn();
                        // HapticFeedback.heavyImpact();
                        // showAlertDialog(context);
                        // setState(() {
                        //   showSpinner = true;
                        // });
                        // heavyImpact();
                      }),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.of(context)
                          .pushNamed(routeManager.forgetPasswords);
                    }),
                    child: const Text(
                      'Forgot your password?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(255, 57, 213, 63),
                          decoration: TextDecoration.underline),
                    ),
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
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = (() {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: const Duration(milliseconds: 300),
                                    child: const Signup(),
                                  ),
                                );
                              }),
                            text: 'SIGN UP',
                            style: const TextStyle(
                                decorationColor:
                                    Color.fromARGB(255, 57, 213, 63),
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 57, 213, 63)))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((context) => Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(color: Colors.black),
                height: 120,
                width: 200,
                child: Column(
                  children: [
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    Text(
                      'Please wait',
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      Utils.showSnackBar('Logged in succesfully');
      print('successful');
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pushNamed(routeManager.loginUp);
      Utils.showSnackBar(e.message);
      print(e);
    }
  }
}
