import 'package:audio_playlist/authentication/auth.dart';
import 'package:audio_playlist/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

Auth auth = Auth();

class _SignupState extends State<Signup> {
  // String email;
  // String password;
  String username = '';
  String email = '';
  String password = '';
  String repassword = '';
  bool seer0 = true;
  bool seer1 = true;
  final _formKey = GlobalKey<FormState>();

  // bool isEmailValid(String val) {
  //   // Loop through each character in the email string
  //   bool value = true;
  //   for (int i = 0; i < email.length; i++) {
  //     if (email[i] == '@') {
  //       value = false; // Found "@" symbol, email is valid
  //     }
  //   }
  //   return value; // "@" symbol not found, email is not valid
  // }

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
                      validator: (val) =>
                          val!.isEmpty ? "Enter a UserName" : null,
                      onChanged: (value) {
                        setState(() => username = value);
                      },
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
                      onChanged: (value) {
                        setState(() => email = value);
                      },
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
                      validator: (val) => val!.isEmpty ||
                              isPasswordValid(val) ||
                              val.length < 8
                          ? "Password must be 8+ char long and contain special chars '[!@#\$%^&*(),.?\":{}|<>]'."
                          : null,
                      onChanged: (value) {
                        setState(() => password = value);
                      },
                      obscureText: seer0,
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
                              seer0 = !seer0;
                            });
                          },
                          child: Icon(
                            seer0 ? Icons.visibility_off : Icons.visibility,
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
                      validator: (val) =>
                          val == password ? null : "Password not a match",
                      onChanged: (value) {
                        setState(() => repassword = value);
                      },
                      obscureText: seer1,
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
                              seer1 = !seer1;
                            });
                          },
                          child: Icon(
                            seer1 ? Icons.visibility_off : Icons.visibility,
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
                        // print(repword);
                        // if (pword == repword) {
                        //   rollin.show(
                        //       message: 'Please wait...',
                        //       textStyle: const TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //       type: SimpleFontelicoProgressDialogType.hurricane,
                        //       backgroundColor: kBackGroundColour,
                        //       indicatorColor: Colors.lightGreenAccent);
                        //   // await Future.delayed(const Duration(milliseconds: 5000));
                        //   // rollin.hide();
                        //   print("Login Successful");
                        //   print(mail);
                        // } else {
                        //   // Vibration.vibrate(duration: 2000);
                        //   // Vibration.cancel();
                        //   showAlertDialog(context);
                        // }
                        // try {
                        //   final newUser = await _auth.createUserWithEmailAndPassword(
                        //       email: mail, password: pword);
                        //   if (newUser != null) {
                        //     Navigator.pushNamed(context, routeManager.homePages);
                        //   }
                        // } catch (e) {
                        //   print(e);
                        // }
                        // auth.registerWithEmailAndPassword(context: context, email: email, password: password, roller: dialog);
                        if (_formKey.currentState!.validate()) {
                          auth.registerWithEmailAndPassword(
                              context: context,
                              email: email,
                              password: password,
                              roller: dialog);
                        }
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
                              Navigator.of(context)
                                  .pushNamed(routeManager.loginUp);
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
}
