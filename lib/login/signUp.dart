import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audio_playlist/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import '../constants.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../main.dart';
import '../popUps/utils.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool toggle = false;
  bool toggle1 = false;
  final controllerUsername = TextEditingController();

  final controllerConfirm = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordValid(String password) {
    // Define the regular expression to check for special characters
    // You can customize this pattern to include other special characters as needed
    final RegExp specialCharsRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');

    return !specialCharsRegex.hasMatch(password);
  }

  // bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog dialog =
        SimpleFontelicoProgressDialog(context: context);
    return Scaffold(
      backgroundColor: kBackGroundColour,
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Form(
            key: _formKey,
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
                            'Sign Up,',
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
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Text(
                        'Sign up',
                        style: TextStyle(
                            color: Color.fromARGB(255, 92, 235, 97),
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
                  child: Text('Username*',
                      style: TextStyle(
                          color: Color.fromARGB(255, 99, 241, 104),
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    child: TextFormField(
                      controller: controllerUsername,
                      validator: (val) =>
                          val!.isEmpty ? "Enter a UserName" : null,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.start,
                      decoration: kTextFieldDecoration.copyWith(
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: 'Enter a UserName',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
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
                      validator: (val) => val!.isEmpty || !val.contains('@')
                          ? "Enter a Valid Email Address"
                          : null,
                      // validator: (val) {
                      //   dynamic data;
                      //   if (val != null) {
                      //     if (val.isEmpty && val.contains('@') == true) {
                      //       data = "Enter a Valid Email Address";
                      //     }
                      //   } else {
                      //     data = null;
                      //   }
                      //   return data;
                      // },

                      keyboardType: TextInputType.emailAddress,
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
                    child: TextFormField(
                      controller: passwordController,
                      validator: (val) => val!.isEmpty ||
                              isPasswordValid(val) ||
                              val.length < 8
                          ? "Password must be 8+ char long and contain special chars '[!@#\$%^&*(),.?\":{}|<>]'."
                          : null,
                      obscureText: toggle,
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
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              toggle = !toggle;
                            });
                          },
                          child: Icon(
                            toggle ? Icons.visibility_off : Icons.visibility,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
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
                    'Re-Enter Password*',
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
                      controller: controllerConfirm,
                      validator: (val) =>
                          controllerConfirm.text == passwordController.text
                              ? null
                              : "Password not a match",
                      obscureText: toggle1,
                      textAlign: TextAlign.start,
                      decoration: kTextFieldDecoration.copyWith(
                        prefixIcon: const Icon(
                          Icons.key_outlined,
                          size: 25,
                          color: Colors.white,
                        ),
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: 'Re-Enter Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              toggle1 = !toggle1;
                            });
                          },
                          child: Icon(
                            toggle1 ? Icons.visibility_off : Icons.visibility,
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
                      onPressed: (() async {
                        signUp();
                      }),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Have an account?',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 57, 213, 63)),
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
                                  type: PageTransitionType.rightToLeft,
                                  duration: const Duration(milliseconds: 300),
                                  child: const Login(),
                                ),
                              );
                            }),
                          text: 'LOG IN',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: ((context) => Center(
              child: CircularProgressIndicator(),
            )));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Utils.showSnackBar('User registered succesfully');
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      Navigator.of(context).pushNamed(routeManager.signUp);
      Utils.showErrorSnackBar(e.message);
    }
  }
}
