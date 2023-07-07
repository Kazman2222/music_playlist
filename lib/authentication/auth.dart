import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home/final_home.dart';
import '../routes/routes.dart';

ElevatedButton signUpButton(
    BuildContext context, String email, String password) {
  final _auth = FirebaseAuth.instance;
  String mail = email;
  String pword = password;

  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          primary: const Color.fromARGB(255, 57, 213, 63)),
      onPressed: (() async {
        print(email);
        try {
          final newUser = await _auth.createUserWithEmailAndPassword(
              email: mail, password: pword);
          if (newUser != null) {
            Navigator.pushNamed(context, routeManager.homePages);
          }
        } catch (e) {
          print(e);
        }
      }),
      child: const Text(
        'Sign Up',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
      ));
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
