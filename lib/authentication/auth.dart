import 'package:audio_playlist/login/logout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../components/buttons.dart';
import '../constants.dart';
import '../home/final_home.dart';
import '../routes/routes.dart';
// import 'package:flutter/services.dart';
// import 'package:vibration/vibration.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> registerWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password,
      required SimpleFontelicoProgressDialog roller}) async {
    SimpleFontelicoProgressDialog rollin = roller;
    try {
      rollin.show(
          message: 'Please wait...',
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          type: SimpleFontelicoProgressDialogType.hurricane,
          backgroundColor: kBackGroundColour,
          indicatorColor: Colors.lightGreenAccent);
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // We store the user in the database
      if (newUser != null) {
        rollin.hide();
        Navigator.pushNamed(context, routeManager.homePages);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password,
      required SimpleFontelicoProgressDialog roller}) async {
    // We store the user in the database
    SimpleFontelicoProgressDialog rollin = roller;
    try {
      rollin.show(
          message: 'Please wait...',
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          type: SimpleFontelicoProgressDialogType.hurricane,
          backgroundColor: kBackGroundColour,
          indicatorColor: Colors.lightGreenAccent);
      final newUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        rollin.hide();
        Navigator.pushNamed(context, routeManager.homePages);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> logoutEmailAndPassword(
      BuildContext context, SimpleFontelicoProgressDialog roller) async {
    SimpleFontelicoProgressDialog rollin = roller;
    rollin.show(
        message: 'Please wait...',
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        type: SimpleFontelicoProgressDialogType.hurricane,
        backgroundColor: kBackGroundColour,
        indicatorColor: Colors.lightGreenAccent);
    await _auth.signOut();
    rollin.hide();
    Navigator.pushNamed(context, routeManager.loginUp);
  }
  // void getCurrentUser() {
  //   try {
  //     final User? user = _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
}

// ElevatedButton loginButton(
//     BuildContext context, String email, String password) {
//   final _auth = FirebaseAuth.instance;
//   String mail = email;
//   String pword = password;
//
//   return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           primary: const Color.fromARGB(255, 57, 213, 63)),
//       onPressed: (() async {
//         try {
//           final newUser = await _auth.createUserWithEmailAndPassword(
//               email: mail, password: pword);
//           if (newUser != null) {
//             Navigator.pushNamed(context, routeManager.homePages);
//           }
//         } catch (e) {
//           print(e);
//         }
//       }),
//       child: const Text(
//         'Login',
//         style: TextStyle(
//             fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
//       ));
// }

// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => const final_home()),
// );

// class SignUpBotton extends StatefulWidget {
//   // const SignUpBotton({Key? key}) : super(key: key);
//   SignUpBotton({this.mail,this.pword});
//
// String? mail;
// String? pword;
//
//
//   @override
//   State<SignUpBotton> createState() => _SignUpBottomState(mail,pword);
// }
//
// class _SignUpBottomState extends State<SignUpBotton> {
//   _SignUpBottomState(this.mail,this.pword);
//   String? mail;
//   String? pword;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             primary: const Color.fromARGB(255, 57, 213, 63)),
//         onPressed: (() async {
//           print(mail);
//           print(pword);
//           // try {
//           //   final newUser = await _auth.createUserWithEmailAndPassword(
//           //       email: mail, password: pword);
//           //   if (newUser != null) {
//           //     Navigator.pushNamed(context, routeManager.homePages);
//           //   }
//           // } catch (e) {
//           //   print(e);
//           // }
//         }),
//         child: const Text(
//           'Sign Up',
//           style: TextStyle(
//               fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
//         ));
//   }
// }
