import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audio_playlist/login/signUp.dart';
import 'package:flutter/material.dart';
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

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool seer = false;
  bool showSpinner = false;

  static Future<void> heavyImpact() async {
    await SystemChannels.platform.invokeMethod<void>(
      'HapticFeedback.vibrate',
      'HapticFeedbackType.heavyImpact',
    );
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
                  child: TextField(
                    onSubmitted: (value) {},
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.emailAddress,
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
                          seer ? Icons.visibility : Icons.visibility_off,
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
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 200),
                          child: const bottom(),
                        ),
                      );
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
                              decorationColor: Color.fromARGB(255, 57, 213, 63),
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
    );
  }
}
